class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new 
    @tags = Tag.all

    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end
  def index
    
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
  	@gossip = Gossip.find(params[:id])
  
    @gossip_comments_count = @gossip.comments.all.count
       @gossip_tags = @gossip.tags.all
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end
  
def create
 
 user = User.find(1)
  @gossip = Gossip.create('title' => params[:title],
                   'content' => params[:content], 
                    user_id: user.id)

  @gossipToTag = GossipToTag.new(gossip_id: @gossip.id, tag_id: params[:tag_id])

  if   @gossipToTag.save && @gossip.save
   
    redirect_to root_path
  else
    render 'new'
  end
end



  def edit
    @gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

 def update
  @gossip = Gossip.find(params[:id])
   parameter = params.require(:gossip).permit(:title, :content)
  if @gossip.update(parameter)
    redirect_to root_path
end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
 @gossip = Gossip.find(params[:id])
 if @gossip.destroy
    redirect_to root_path

 
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
  end
end