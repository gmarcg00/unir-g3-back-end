class AdminInfoResponse {
    constructor(user){
        this.id = user.id;
        this.name = user.name;
        this.last_names = user.last_names;
        this.phone = user.phone;
        this.email = user.email;
        this.username = user.username;
        this.image = user.image;
        this.role = user.roles_id;
    }

}

module.exports = AdminInfoResponse;