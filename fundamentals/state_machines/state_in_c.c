#include "stm32f411xx.h"

#define TRAFFIC_LIGHTS_PORT         GPIOA
#define CAR_SENSOR_PORT             GPIOC

#define EAST_LED_RED                (1U << 9)
#define EAST_LED_YELLOW             (1U << 8)
#define EAST_LED_GREEN              (1U << 7)

#define NORTH_LED_RED               (1U << 6)
#define NORTH_LED_YELLOW            (1U << 5)
#define NORTH_LED_GREEN             (1U << 4)

#define EAST_LED_RED_MODE_BIT       (1U << 18)
#define EAST_LED_YELLOW_MODE_BIT    (1U << 16)
#define EAST_LED_GREEN_MODE_BIT     (1U << 14)

#define NORTH_LED_RED_MODE_BIT      (1U << 18)
#define NORTH_LED_YELLOW_MODE_BIT   (1U << 16)
#define NORTH_LED_GREEN_MODE_BIT    (1U << 14)

// go_north, PA9-4   = 100001 makes it green on North and red on East
// wait_north, PA9-4 = 100010 makes it yellow on North and red on East
// go_east, PA9-4    = 001100 makes it red on North and green on East
// wait_east, PA9-4  = 010100 makes it red on North and yellow on East

struct State
{
    uint32_t output;
    uint32_t time;
    uint8_t next_state[4];
};

typedef const struct State stateType;


int main(void)
{

}