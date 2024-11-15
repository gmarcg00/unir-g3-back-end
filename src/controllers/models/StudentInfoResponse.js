class StudentInfoResponse {
    constructor(user,student) {
        this.id = user.id;
        this.name = user.name;
        this.last_names = user.last_names;
        this.phone = user.phone;
        this.email = user.email;
        this.username = user.username;
        this.image = user.image;
        this.role = user.role_id;
        this.active = student.active;
    }
}

module.exports = StudentInfoResponse;