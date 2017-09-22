From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 08/11] staging: typec: tcpm: Set mux to device mode
 when configured as such
Date: Fri, 22 Sep 2017 16:02:27 +0200
Message-ID: <65cf943e-668b-a9e2-bd4c-e272c87cb18f@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-9-hdegoede@redhat.com>
 <d95237a4-63da-4d5e-5dba-3354df78306b@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d95237a4-63da-4d5e-5dba-3354df78306b@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 09/11/2017 12:56 AM, Guenter Roeck wrote:
> On 09/05/2017 09:42 AM, Hans de Goede wrote:
>> Setting the mux to TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT when the
>> data-role is device is not correct. Plenty of devices support operating
>> as USB device through a (separate) USB device controller.
>>
>> So this commit instead splits out TYPEC_MUX_USB into TYPEC_MUX_USB_HOST
>> and TYPEC_MUX_USB_DEVICE and makes tcpm_set_roles() set the mux
>> accordingly.
>>
>> Likewise TCPC_MUX_DP gets renamed to TCPC_MUX_DP_SRC to make clear that
>> this is for configuring the Type-C port as a Display Port source, not a
>> sink.
>>
>> Last this commit makes tcpm_reset_port() to set the mux to
>> TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT so that it does not and up
>> staying in host (and with this commit also device) mode after a detach.
>>
> This sentence is hard to understand.

Ok, changed to:

"Last this commit makes tcpm_reset_port() call tcpm_mux_set(port,
TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT) so that the mux does _not_
stay in its last mode after a detach."

For v3 of this patchset.

> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Otherwise
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

And added your Reviewed-by.

Thanks & Regards,

Hans




>
> 
>> ---
>>   drivers/staging/typec/tcpm.c |  7 ++++---
>>   drivers/staging/typec/tcpm.h | 22 ++++++++++++++--------
>>   2 files changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/staging/typec/tcpm.c b/drivers/staging/typec/tcpm.c
>> index 8af62e74d54c..ffe7e26d4ed3 100644
>> --- a/drivers/staging/typec/tcpm.c
>> +++ b/drivers/staging/typec/tcpm.c
>> @@ -752,11 +752,11 @@ static int tcpm_set_roles(struct tcpm_port *port, bool attached,
>>       int ret;
>>       if (data == TYPEC_HOST)
>> -        ret = tcpm_mux_set(port, TYPEC_MUX_USB,
>> +        ret = tcpm_mux_set(port, TYPEC_MUX_USB_HOST,
>>                      TCPC_USB_SWITCH_CONNECT);
>>       else
>> -        ret = tcpm_mux_set(port, TYPEC_MUX_NONE,
>> -                   TCPC_USB_SWITCH_DISCONNECT);
>> +        ret = tcpm_mux_set(port, TYPEC_MUX_USB_DEVICE,
>> +                   TCPC_USB_SWITCH_CONNECT);
>>       if (ret < 0)
>>           return ret;
>> @@ -2025,6 +2025,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
>>       tcpm_init_vconn(port);
>>       tcpm_set_current_limit(port, 0, 0);
>>       tcpm_set_polarity(port, TYPEC_POLARITY_CC1);
>> +    tcpm_mux_set(port, TYPEC_MUX_NONE, TCPC_USB_SWITCH_DISCONNECT);
>>       tcpm_set_attached_state(port, false);
>>       port->try_src_count = 0;
>>       port->try_snk_count = 0;
>> diff --git a/drivers/staging/typec/tcpm.h b/drivers/staging/typec/tcpm.h
>> index 7e9a6b7b5cd6..f662eed48c86 100644
>> --- a/drivers/staging/typec/tcpm.h
>> +++ b/drivers/staging/typec/tcpm.h
>> @@ -83,17 +83,23 @@ enum tcpc_usb_switch {
>>   };
>>   /* Mux state attributes */
>> -#define TCPC_MUX_USB_ENABLED        BIT(0)    /* USB enabled */
>> -#define TCPC_MUX_DP_ENABLED        BIT(1)    /* DP enabled */
>> -#define TCPC_MUX_POLARITY_INVERTED    BIT(2)    /* Polarity inverted */
>> +#define TCPC_MUX_USB_DEVICE_ENABLED        BIT(0)    /* USB device enabled */
>> +#define TCPC_MUX_USB_HOST_ENABLED        BIT(1)    /* USB host enabled */
>> +#define TCPC_MUX_DP_SRC_ENABLED            BIT(2)    /* DP enabled */
>> +#define TCPC_MUX_POLARITY_INVERTED        BIT(3)    /* Polarity inverted */
>>   /* Mux modes, decoded to attributes */
>>   enum tcpc_mux_mode {
>> -    TYPEC_MUX_NONE    = 0,                /* Open switch */
>> -    TYPEC_MUX_USB    = TCPC_MUX_USB_ENABLED,        /* USB only */
>> -    TYPEC_MUX_DP    = TCPC_MUX_DP_ENABLED,        /* DP only */
>> -    TYPEC_MUX_DOCK    = TCPC_MUX_USB_ENABLED |    /* Both USB and DP */
>> -              TCPC_MUX_DP_ENABLED,
>> +    /* Open switch */
>> +    TYPEC_MUX_NONE = 0,
>> +    /* USB device only */
>> +    TYPEC_MUX_USB_DEVICE = TCPC_MUX_USB_DEVICE_ENABLED,
>> +    /* USB host only */
>> +    TYPEC_MUX_USB_HOST = TCPC_MUX_USB_HOST_ENABLED,
>> +    /* DP source only */
>> +    TYPEC_MUX_DP = TCPC_MUX_DP_SRC_ENABLED,
>> +    /* Both USB host and DP source */
>> +    TYPEC_MUX_DOCK = TCPC_MUX_USB_HOST_ENABLED | TCPC_MUX_DP_SRC_ENABLED,
>>   };
>>   struct tcpc_mux_dev {
>>
> 
