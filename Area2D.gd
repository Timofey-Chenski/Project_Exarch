extends Area2D

export var maxRange = 1200.0
export var speed = 120.0
onready var animator = $BulletAnimation

var _travelled_distance = 0

func _physics_process(delta: float) -> void:
	animator.play("Projectile")
	var distance = speed * delta
	var motion = transform.x * speed * delta
	position += motion
	
	_travelled_distance += distance
	if _travelled_distance >= maxRange: queue_free()

#  Код из С# для нахождения близлишжашего врага, для примерта
#		float distanceToClosestEnemy = Mathf.Infinity;
#		Enemy closestEnemy = null;
#		Enemy[] allEnemies = GameObject.FindObjectsOfType<Enemy>();
#
#		foreach (Enemy currentEnemy in allEnemies) {
#			float distanceToEnemy = (currentEnemy.transform.position - this.transform.position).sqrMagnitude;
#			if (distanceToEnemy < distanceToClosestEnemy) {
#				distanceToClosestEnemy = distanceToEnemy;
#				closestEnemy = currentEnemy;
#			}
#		}
#		Debug.DrawLine (this.transform.position, closestEnemy.transform.position);
#	}
#}
