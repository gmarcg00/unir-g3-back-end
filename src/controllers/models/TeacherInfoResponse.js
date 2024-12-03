class TeacherInfoResponse {
    constructor(user,teacher,knowledge_branches) {
        this.id = user.id;
        this.name = user.name;
        this.last_names = user.last_names;
        this.phone = user.phone;
        this.email = user.email;
        this.username = user.username;
        this.image = user.image;
        this.role = user.role_id;
        this.latitude = user.latitude;
        this.longitude = user.longitude;
        this.description = teacher.description;
        this.active = teacher.active;
        this.price_hour = teacher.price_hour;
        this.knowledge_branches = knowledge_branches;
    }
}

module.exports = TeacherInfoResponse;