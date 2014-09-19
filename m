From: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 1/9] eeepc-laptop: clean up coding style
Date: Fri, 19 Sep 2014 19:17:55 +0200
Message-ID: <cefb1a30-16eb-4ac4-8a7e-5558e8cc5525@email.android.com>
References: <1410990447-3210-1-git-send-email-fransklaver@gmail.com> <1410990447-3210-2-git-send-email-fransklaver@gmail.com> <1410991612.4290.10.camel@joe-AO725> <642509cf-05f2-47f4-be2e-a3cfb9a93a04@email.android.com> <20140919164603.GB34042@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140919164603.GB34042@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Joe Perches <joe@perches.com>, Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 19 September 2014 18:46:03 CEST, Darren Hart <dvhart@infradead.org> wrote:
>On Thu, Sep 18, 2014 at 07:01:25AM +0200, Frans Klaver wrote:
>> On 18 September 2014 00:06:52 CEST, Joe Perches <joe@perches.com>
>wrote:
>> >On Wed, 2014-09-17 at 23:47 +0200, Frans Klaver wrote:
>> >> Correct indentation and brace usage to comply with
>> >> Documentation/CodingStyle.
>> >> 
>> >> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
>> >> ---
>> >>  drivers/platform/x86/eeepc-laptop.c | 8 +++++---
>> >>  1 file changed, 5 insertions(+), 3 deletions(-)
>> >> 
>> >> diff --git a/drivers/platform/x86/eeepc-laptop.c
>> >b/drivers/platform/x86/eeepc-laptop.c
>> >> index 3095d38..653999e 100644
>> >> --- a/drivers/platform/x86/eeepc-laptop.c
>> >> +++ b/drivers/platform/x86/eeepc-laptop.c
>> >> @@ -544,7 +544,7 @@ static int eeepc_led_init(struct eeepc_laptop
>> >*eeepc)
>> >>  	eeepc->tpd_led.name = "eeepc::touchpad";
>> >>  	eeepc->tpd_led.brightness_set = tpd_led_set;
>> >>  	if (get_acpi(eeepc, CM_ASL_TPD) >= 0) /* if method is available
>*/
>> >> -	  eeepc->tpd_led.brightness_get = tpd_led_get;
>> >> +		eeepc->tpd_led.brightness_get = tpd_led_get;
>> >>  	eeepc->tpd_led.max_brightness = 1;
>> >>  
>> >>  	rv = led_classdev_register(&eeepc->platform_device->dev,
>> >> @@ -692,8 +692,9 @@ static int
>eeepc_register_rfkill_notifier(struct
>> >eeepc_laptop *eeepc,
>> >>  		 * changed during setup.
>> >>  		 */
>> >>  		eeepc_rfkill_hotplug(eeepc, handle);
>> >> -	} else
>> >> +	} else {
>> >>  		return -ENODEV;
>> >> +	}
>> >>  
>> >>  	return 0;
>> >>  }
>> >
>> >This sort of code:
>> >
>> >	if (foo) {
>> >		[ do_something ]
>> >	} else
>> >		return -ERRVAL;
>> >
>> >is generally better rewritten as:
>> >
>> >	if (!foo)
>> >		return -ERRVAL;
>> >
>> >	[ do_something ]
>> >
>> >This gives immediacy to the error handler and
>> >as well reduces unnecessary indentation.
>> 
>> I fully agree. 
>> 
>> Darren, do you still take this in one patch? 
>
>I'll take the cleanup patch as is. I'm happy to take a separate patch
>to improve
>the code flow.

Alright. Thanks. 

Frans 
