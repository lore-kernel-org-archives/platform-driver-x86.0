Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D756CC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 17:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94D2261205
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 17:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhDGRsP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 13:48:15 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:42763 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233520AbhDGRsN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 13:48:13 -0400
Received: from [100.112.6.224] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id 31/38-51730-350FD606; Wed, 07 Apr 2021 17:48:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRWlGSWpSXmKPExsWS8eIhj27Qh9w
  Egwdf1S3eHJ/OZNF67xebxbbmw4wWq/e8YLa4MvkGo8Xp3SUObB47Z91l91i8aT+bx6ZVnWwe
  7/ddZfP4vEkugDWKNTMvKb8igTXj+5Z9bAWd8RV3+o+zNDA2BXUxcnEICfxnlFhy9iArhPOcU
  WL7k41ADgeHsEC4xMcLviBxEYE3jBJHli5l7mLk5GAWkJA43LuLHaJhPqPE9X8/mEASbALaEl
  u2/GIDsXkFbCV2zv8EFmcRUJE49qoVrFkUaGjvldusEDWCEidnPmEBsTkFrCVur1jIDLKYWUB
  TYv0ufYhd4hK3nsxngrDlJZq3zgYbIyGgILHo/WY2CDtBouffI7YJjIKzkEydhTBpFpJJs5BM
  WsDIsorRNKkoMz2jJDcxM0fX0MBA19DQSNdU19hQL7FKN1mvtFg3NbG4RBfILS/WK67MTc5J0
  ctLLdnECIyflAJW+R2Mv15/0DvEKMnBpCTKa/ckN0GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO
  /Rd0A5waLU9NSKtMwcYCzDpCU4eJREeHNeAqV5iwsSc4sz0yFSpxh1OW6+X7KIWYglLz8vVUq
  cdxnIDAGQoozSPLgRsLRyiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw73GQKTyZeSVwm14B
  HcEEdETJQbAjShIRUlINTOfFVXnPPj5eVJq25aWPwOEITsM9B90eL3nmIv8za6P37/h9lVLZp
  5oUF782mxJ8YParRbWNjurV8zrNzytf8ZtVqn+9PXBnlOhqEcuCS/z+rFGLr520Cpl9TzdA8q
  /ZlEOPzoZvn23XxV7q8L1wav5R26u6J15YTD3d8TSUm30Xk9M5jy3f7k+b6j29N/xtgbOcg0O
  v/sUZNVKFjFqHzsiFxXHlbn2exd97pFnK930tr7lVn+M9prKd9Qw7J4WucA/M/2/0WOwHy5z1
  MvVcwjm89a82mFlEn+07WafYF7oionjxe02ttpnV96Ysd6u/dvXYMfOP3sWiH998PWp0ZwK/w
  EKHvZN2PmW6/re8S4mlOCPRUIu5qDgRANX/I6SmAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-20.tower-406.messagelabs.com!1617817682!227537!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27965 invoked from network); 7 Apr 2021 17:48:02 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-20.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Apr 2021 17:48:02 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 706A4A1DCA7C22A4BA44;
        Wed,  7 Apr 2021 13:48:02 -0400 (EDT)
Received: from localhost.localdomain (10.38.98.103) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Wed, 7 Apr 2021
 13:48:01 -0400
Subject: Re: [External] Re: [PATCH 1/3] thinkpad_acpi: add support for
 force_discharge
To:     Thomas Koch <linrunner@gmx.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
CC:     <smclt30p@gmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <6ead1585-9743-e56b-6552-564fabdd9930@gmx.net>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <b99aa7c2-0086-2f0b-f7b7-8ac7033b68d4@lenovo.com>
Date:   Wed, 7 Apr 2021 13:48:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6ead1585-9743-e56b-6552-564fabdd9930@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.98.103]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Thomas, Hans and Nicolo

On 07/04/2021 08:19, Thomas Koch wrote:
> Hi Hans,
> 
>> 1. These features are useful, but not super useful and as such I wonder
>> how often they are used and this how well tested the firmware is wrt
>> these.
> 
>> I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you
>> comment on if it is ok from a firmware pov to try and use the following
>> battery related ACPI methods on all thinkpads? :
>> #define GET_DISCHARGE    "BDSG"
>> #define SET_DISCHARGE    "BDSS"
>> #define GET_INHIBIT    "PSSG"
>> #define SET_INHIBIT    "BICS"
> 
> These ACPI methods are present in (with very few exceptions) all
> ThinkPads released since 2012. I am curious to hear what Mark and Nitin
> have to say, never read anything official about it.

I'm afraid I've not come across these myself before, but will go and ask
the firmware team.
<For my internal reference LO-1115>

It would be good to confirm the implementation details if I can. I found
recently that some of the temperature sensors that are read in by
thinkpad_acpi from the EC RAM are not temp sensors (patch coming
soon....hopefully later today). Hopefully I can check the internal spec
and give a thumbs up on the implementation - even if we're not allowed
to share the actual paperwork (maybe one day....)

> 
> Since 2012 there is also userspace tool tpacpi-bat [1] employing them
> along with those for the start/stop threshold.
> 
> My own tool TLP makes use of tpacpi-bat for force_discharge also since
> 2012. From my experience in TLP support i can say there's a significant
> user base and those who use thresholds also want to use force_discharge
> for recalibration from time to time.

This probably isn't the right place for the discussion, but I've been
meaning to dig into battery management but never really get the time. I
know in the windows world that ThinkVantage has extra hooks for setting
thresholds and I wanted to see what we can do on the Linux side. If
there is anything that would be particularly helpful that is missing
please let me know.

Thanks
Mark

> 
> 
> The patches at hand work flawlessly on my small ThinkPad collection.
> [1] https://github.com/teleshoes/tpacpi-bat
> 
> 
> 
> -- 
> 
> Freundliche Grüße / Kind regards,
> 
> Thomas Koch
> 
> 
> 
> Mail : linrunner@gmx.net
> 
> Web  : https://linrunner.de/tlp
> 
> 
> On 07.04.21 12:24, Hans de Goede wrote:
>> Hi Nicola,
>>
>> Thank you for your patch series.
>>
>> I'm not sure what to do with these. I have a couple of concerns here:
>>
>> 1. These features are useful, but not super useful and as such I wonder
>> how often they are used and this how well tested the firmware is wrt
>> these.
>> I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you
>> comment on if it is ok from a firmware pov to try and use the following
>> battery related ACPI methods on all thinkpads? :
>>
>> #define GET_DISCHARGE    "BDSG"
>> #define SET_DISCHARGE    "BDSS"
>> #define GET_INHIBIT    "PSSG"
>> #define SET_INHIBIT    "BICS"
>>
>>
>> 2. If we add support for this to the kernel we should probably
>> first agree on standardized power-supply class property names for
>> these, rather then coming up with our own names. ATM we register
>> 2 names for the charge start threshold, the one which the thinkpad_acpi
>> code invented and the standardized name which was later added.
>>
>> I've added Sebastian, the power-supply class / driver maintainer to
>> the Cc. for this. Sebastian Nicolo wants to add support for 2 new
>> features as power-supply properties:
>>
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> ...
>> +Battery forced discharging
>> +--------------------------
>> +
>> +sysfs attribute:
>> +/sys/class/power_supply/BATx/force_discharge
>> +
>> +Setting this attribute to 1 forces the battery to discharge while AC
>> is attached.
>> +Setting it to 0 terminates forced discharging.
>> +
>> +Battery charge inhibiting
>> +--------------------------
>> +
>> +sysfs attribute:
>> +/sys/class/power_supply/BATx/inhibit_discharge
>> +
>> +Setting this attribute to 1 stops charging of the battery as a manual
>> override
>> +over the threshold attributes. Setting it to 0 terminates the override.
>>
>> Sebastian, I believe that this should be changes to instead be documented
>> in: Documentation/ABI/testing/sysfs-class-power
>> and besides the rename I was wondering if you have any remarks on the
>> proposed
>> API before Nicolo sends out a v2 ?
>>
>> Regards,
>>
>> Hans
>>
>>
>> On 3/17/21 3:01 PM, Nicolo' Piazzalunga wrote:
>>> Lenovo ThinkPad systems have a feature that lets you
>>> force the battery to discharge when AC is attached.
>>>
>>> This patch implements that feature and exposes it via the generic
>>> ACPI battery driver in the generic location:
>>>
>>> /sys/class/power_supply/BATx/force_discharge
>>>
>>> Signed-off-by: Ognjen Galic <smclt30p@gmail.com>
>>> Signed-off-by: Thomas Koch <linrunner@gmx.net>
>>> Signed-off-by: Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
>>> ---
>>>   drivers/platform/x86/thinkpad_acpi.c | 59 ++++++++++++++++++++++++++--
>>>   1 file changed, 55 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>>> b/drivers/platform/x86/thinkpad_acpi.c
>>> index 9c4df41687a3..6c7dca3a10d2 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -9317,6 +9317,8 @@ static struct ibm_struct mute_led_driver_data = {
>>>   #define SET_START    "BCCS"
>>>   #define GET_STOP    "BCSG"
>>>   #define SET_STOP    "BCSS"
>>> +#define GET_DISCHARGE    "BDSG"
>>> +#define SET_DISCHARGE    "BDSS"
>>>
>>>   enum {
>>>       BAT_ANY = 0,
>>> @@ -9333,6 +9335,7 @@ enum {
>>>       /* This is used in the get/set helpers */
>>>       THRESHOLD_START,
>>>       THRESHOLD_STOP,
>>> +    FORCE_DISCHARGE
>>>   };
>>>
>>>   struct tpacpi_battery_data {
>>> @@ -9340,6 +9343,7 @@ struct tpacpi_battery_data {
>>>       int start_support;
>>>       int charge_stop;
>>>       int stop_support;
>>> +    int discharge_support;
>>>   };
>>>
>>>   struct tpacpi_battery_driver_data {
>>> @@ -9397,6 +9401,12 @@ static int tpacpi_battery_get(int what, int
>>> battery, int *ret)
>>>           if (*ret == 0)
>>>               *ret = 100;
>>>           return 0;
>>> +    case FORCE_DISCHARGE:
>>> +        if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE, ret,
>>> battery))
>>> +            return -ENODEV;
>>> +        /* The force discharge status is in bit 0 */
>>> +        *ret = *ret & 0x01;
>>> +        return 0;
>>>       default:
>>>           pr_crit("wrong parameter: %d", what);
>>>           return -EINVAL;
>>> @@ -9425,6 +9435,16 @@ static int tpacpi_battery_set(int what, int
>>> battery, int value)
>>>               return -ENODEV;
>>>           }
>>>           return 0;
>>> +    case FORCE_DISCHARGE:
>>> +        /* Force discharge is in bit 0,
>>> +         * break on AC attach is in bit 1 (won't work on some
>>> ThinkPads),
>>> +         * battery ID is in bits 8-9, 2 bits.
>>> +         */
>>> +        if ACPI_FAILURE(tpacpi_battery_acpi_eval(SET_DISCHARGE,
>>> &ret, param)) {
>>> +            pr_err("failed to set force dischrage on %d", battery);
>>> +            return -ENODEV;
>>> +        }
>>> +        return 0;
>>>       default:
>>>           pr_crit("wrong parameter: %d", what);
>>>           return -EINVAL;
>>> @@ -9443,6 +9463,8 @@ static int tpacpi_battery_probe(int battery)
>>>        * 2) Check for support
>>>        * 3) Get the current stop threshold
>>>        * 4) Check for support
>>> +     * 5) Get the current force discharge status
>>> +     * 6) Check for support
>>>        */
>>>       if (acpi_has_method(hkey_handle, GET_START)) {
>>>           if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, &ret,
>>> battery)) {
>>> @@ -9479,11 +9501,16 @@ static int tpacpi_battery_probe(int battery)
>>>               return -ENODEV;
>>>           }
>>>       }
>>> -    pr_info("battery %d registered (start %d, stop %d)",
>>> +    if (acpi_has_method(hkey_handle, GET_DISCHARGE))
>>> +        if (!ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_DISCHARGE,
>>> &ret, battery)))
>>> +            /* Support is marked in bit 8 */
>>> +            battery_info.batteries[battery].discharge_support = ret
>>> & BIT(8);
>>> +
>>> +    pr_info("battery %d registered (start %d, stop %d, force: %d)",
>>>               battery,
>>>               battery_info.batteries[battery].charge_start,
>>> -            battery_info.batteries[battery].charge_stop);
>>> -
>>> +            battery_info.batteries[battery].charge_stop,
>>> +            battery_info.batteries[battery].discharge_support);
>>>       return 0;
>>>   }
>>>
>>> @@ -9569,6 +9596,15 @@ static ssize_t tpacpi_battery_store(int what,
>>>           if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
>>>               return -EINVAL;
>>>           return count;
>>> +    case FORCE_DISCHARGE:
>>> +        if (!battery_info.batteries[battery].discharge_support)
>>> +            return -ENODEV;
>>> +        /* The only valid values are 1 and 0 */
>>> +        if (value != 0 && value != 1)
>>> +            return -EINVAL;
>>> +        if (tpacpi_battery_set(FORCE_DISCHARGE, battery, value))
>>> +            return -ENODEV;
>>> +        return count;
>>>       default:
>>>           pr_crit("Wrong parameter: %d", what);
>>>           return -EINVAL;
>>> @@ -9617,6 +9653,13 @@ static ssize_t
>>> charge_control_end_threshold_show(struct device *device,
>>>       return tpacpi_battery_show(THRESHOLD_STOP, device, buf);
>>>   }
>>>
>>> +static ssize_t force_discharge_show(struct device *device,
>>> +                struct device_attribute *attr,
>>> +                char *buf)
>>> +{
>>> +    return tpacpi_battery_show(FORCE_DISCHARGE, device, buf);
>>> +}
>>> +
>>>   static ssize_t charge_control_start_threshold_store(struct device
>>> *dev,
>>>                   struct device_attribute *attr,
>>>                   const char *buf, size_t count)
>>> @@ -9631,8 +9674,16 @@ static ssize_t
>>> charge_control_end_threshold_store(struct device *dev,
>>>       return tpacpi_battery_store(THRESHOLD_STOP, dev, buf, count);
>>>   }
>>>
>>> +static ssize_t force_discharge_store(struct device *dev,
>>> +                struct device_attribute *attr,
>>> +                const char *buf, size_t count)
>>> +{
>>> +    return tpacpi_battery_store(FORCE_DISCHARGE, dev, buf, count);
>>> +}
>>> +
>>>   static DEVICE_ATTR_RW(charge_control_start_threshold);
>>>   static DEVICE_ATTR_RW(charge_control_end_threshold);
>>> +static DEVICE_ATTR_RW(force_discharge);
>>>   static struct device_attribute dev_attr_charge_start_threshold =
>>> __ATTR(
>>>       charge_start_threshold,
>>>       0644,
>>> @@ -9645,12 +9696,12 @@ static struct device_attribute
>>> dev_attr_charge_stop_threshold = __ATTR(
>>>       charge_control_end_threshold_show,
>>>       charge_control_end_threshold_store
>>>   );
>>> -
>>>   static struct attribute *tpacpi_battery_attrs[] = {
>>>       &dev_attr_charge_control_start_threshold.attr,
>>>       &dev_attr_charge_control_end_threshold.attr,
>>>       &dev_attr_charge_start_threshold.attr,
>>>       &dev_attr_charge_stop_threshold.attr,
>>> +    &dev_attr_force_discharge.attr,
>>>       NULL,
>>>   };
>>>
>>>
>>
> 
