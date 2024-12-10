import time
import logging

from celery import shared_task


logger = logging.getLogger(__name__)

@shared_task(name='count_task')
def count_task():
    logger.info('Task started')
    for i in range(1, 11):
        logger.info(f'Counted {i} seconds')
        time.sleep(1)
    logger.info('Task completed')
    return 'Task finished'