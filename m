Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F2FC2B9F7
	for <platform-driver-x86@archiver.kernel.org>; Fri, 28 May 2021 17:36:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3158613B4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 28 May 2021 17:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhE1Rhy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 28 May 2021 13:37:54 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:24660 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229450AbhE1Rhw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 May 2021 13:37:52 -0400
Received: from [100.112.6.224] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id 27/21-55221-11A21B06; Fri, 28 May 2021 17:36:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleJIrShJLcpLzFFi42LJePGQR1dAa2O
  CwZvN2hYvJxxmtDi04QCTRXf3XCaLN8enM1ms3vOC2WLRxydsDmwek2bOYPbYOesuu8f7fVfZ
  PD5vkgtgiWLNzEvKr0hgzZg06whbwWSLihWrTRsYJ2p1MXJyCAn8Z5Q4srasi5ELyH7MKPF/9
  wNWkISwQJHEmmkb2bsY2TlEBPQl9oOVMAucZ5S4fO0IE0T9KUaJCTPWMoPUswloS2zZ8osNxO
  YVsJV417UNLM4ioCox4808RhBbVCBcYnfHSyaIGkGJkzOfsIDYnAKBEkcmvgGyOYA2aEqs36U
  PEmYWEJe49WQ+E4QtL7H97RywkRICihLndsxhh7ATJHr+PWKbwCg4C8nUWQiTZiGZNAvJpAWM
  LKsYzZKKMtMzSnITM3N0DQ0MdA0NjXTNdI0MTPQSq3ST9UqLdVMTi0t0DfUSy4v1iitzk3NS9
  PJSSzYxAmMmpYDtzA7G7W8+6B1ilORgUhLlPcWwMUGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO
  8lDaCcYFFqempFWmYOMH5h0hIcPEoivKWaQGne4oLE3OLMdIjUKUZFKXHeRSB9AiCJjNI8uDZ
  YyrjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXD2Q8T2ZeCdz0V0CLmYAWCyWuA1lckoiQ
  kmpgks3pnijOcO3nHP8i4ezJobU7eP86OtloZ5W1CpycqXCh62H8lHniWsFW5w/2Pf97M8uHQ
  Wvi/eAF3o66KQt9q7f8m3UvWWnf48cNkVIKK+6sjHLX7TddK+eaVWR8f4mblssMG8spyWsuMH
  66xzvTWtkonPXN1WgdC8tJgscnXBDM3dZZteBAcGrQhoXWWbo+vcu1raKOP7h7xeF+xUQ9cdm
  3i8pXrhHYULRbqfpCypbDPxtKPqTN3ZbhXNtY+m/RFGHF2RoL1r7/OfmS4Jxv74vsKpuVngl/
  zDTn9v3nXpOTP3WrW0QH8+3M81n521/Pf7u2wvvPjbLcyeuro9giner5GR4c9gz3Wu/lw/ZFi
  aU4I9FQi7moOBEA3l4EX5QDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-416.messagelabs.com!1622223376!117977!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20348 invoked from network); 28 May 2021 17:36:16 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-9.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 May 2021 17:36:16 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 7B78FF1745B66F38AD8B;
        Fri, 28 May 2021 13:36:16 -0400 (EDT)
Received: from [10.46.208.156] (10.46.208.156) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Fri, 28 May
 2021 13:36:16 -0400
Subject: Re: [External] Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        <Dell.Client.Kernel@dell.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com>
 <CAHp75Vd8wowab89tCZSJNfzAYAGCW8khD0JnmYTyT=czLT+R3A@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <ae3e876f-5532-5fae-6879-7d7bf150241a@lenovo.com>
Date:   Fri, 28 May 2021 13:36:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd8wowab89tCZSJNfzAYAGCW8khD0JnmYTyT=czLT+R3A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.208.156]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 2021-05-27 10:16 a.m., Andy Shevchenko wrote:
> On Wed, May 26, 2021 at 11:15 PM Mark Pearson <markpearson@lenovo.com> wrote:
>>
>> For Lenovo platforms that support a WMI interface to the BIOS add
>> support, using the firmware-attributes class, to allow users to access
>> and modify various BIOS related settings.
> 
> Thanks for an update! My comments below.
> 
> ...
> 
>> +/*
>> + * think-lmi.c - Think LMI BIOS configuration driver
> 
> It's not the best idea to include the file name into the file. If the
> file gets renamed (by whatever reason) often this either brings an
> additional burden or simply forgotten (as from my experience). I
> recommend to drop the file names from the source code.
Good advice - I'll update

> 
>> + * Copyright(C) 2019-2021 Lenovo
>> + *
>> + * Original code from Thinkpad-wmi project https://github.com/iksaif/thinkpad-wmi
>> + * Copyright(C) 2017 Corentin Chary <corentin.chary@gmail.com>
>> + * Distributed under the GPL-2.0 license
>> + */
> 
> ...
> 
>> +#include <linux/acpi.h>
> 
> linux/errno.h ?
> 
>> +#include <linux/fs.h>
> 
> linux/string.h ?
> linux/types.h ?
> 
>> +#include <linux/wmi.h>
>> +#include "firmware_attributes_class.h"
>> +#include "think-lmi.h"

I hadn't included those as they call get pulled in by linux/acpi.h - so
aren't needed here. I take it best practice is to add them. I'd
deliberately stripped down the list to the bare minimu previously but
happy to reverse that if it's preferred.

> 
> ...
> 
>> + * Type:
>> + *  Method
>> + * Arguments:
>> + *  "Item,Value,Password,Encoding,KbdLang;"
>> + * Example:
>> + *  "WakeOnLAN,Disable,pswd,ascii,us;"
> 
> Is 'pswd' here an example of the password? Hacker's language can make
> it more visible, e.g. 'pa55w0rd'.
> Same for other examples.
Yes it is. I can update that :)
> 
>> + */
> 
> ...
> 
>> +       /*
>> +        * Duplicated call required to match bios workaround for behavior
> 
> bios -> BIOS
Ack
> 
>> +        * seen when WMI accessed via scripting on other OS.
>> +        */
> 
> ...
> 
>> +       struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> 
> Candidate to have something like
> 
> #define to_tlmi_pwd_setting(obj)  container_of(...)
> 
> since it has appeared a few times.
Ack

> 
>> +       return sysfs_emit(buf, "%d\n", setting->valid);
>> +}
> 
>> +
> 
> Unneeded blank line. Same for other similar places.
Shoot - I thought I'd cleaned a bunch of these up. I'll do another pass.
> 
>> +static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
> 
> Hmm... We have already define_one_global_ro(). The problems with that
> are the name and location. But perhaps you can copy that macro here
> with the same name and at least we can see the common grounds to clean
> up in the future. Another possibility is to comment that it can be
> replaced with the above mentioned macro. Ideally would be to refactor
> right now, but it's not anyhow crucial or required for this series, so
> may be postponed.
OK - I'll have a look. I'm not 100% sure I understand the issues, but
hopefully it will become clearer once I play with it a bit
> 
> ...
> 
>> +       int pwdlen;
> 
> Strictly speaking it should be size_t.
> 
>> +       pwdlen = strlen(buf);
>> +       if (buf[pwdlen-1] == '\n')
>> +               pwdlen--;
> 
> But the question is what will happen with the string like
> 'pa55\nw0rd\n' (note all \n:s)?
> See also below.
I know there is discussion on this in future mails, so I'll leave this
one for those
> 
>> +       /* pwdlen == 0 is allowed to clear the password */
>> +       if (pwdlen != 0 && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))
> 
> The ' != 0' part is redundant.
Ack
> 
>> +               return -EINVAL;
> 
>> +       memcpy(setting->password, buf, pwdlen);
>> +       setting->password[pwdlen] = '\0';
> 
> I'm not sure why we can't use strscpy() like you did in the other function.
I'm not sure either :) I'll update
> 
>> +       return count;
> 
> ...
> 
>> +       /* Strip out CR if one is present, setting password won't work if it is present */
>> +       strreplace(new_pwd, '\n', '\0');
> 
> Basically it will stop on the first one. See the strchrnul() trick below.
Thanks for the strchrnul trick - happy to use that

> 
>> +       pwdlen = strlen(new_pwd);
>> +       /* pwdlen == 0 is allowed to clear the password */
>> +       if (pwdlen != 0 && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen))) {
> 
> No need for ' != 0'.
Ack
> 
>> +               ret = -EINVAL;
>> +               goto out;
>> +       }
> 
>> +}
> 
> 
> ...
> 
>> +       int length;
>> +
>> +       length = strlen(buf);
>> +       if (buf[length-1] == '\n')
>> +               length--;
>> +
>> +       if (!length || (length >= TLMI_LANG_MAXLEN))
>> +               return -EINVAL;
>> +
>> +       memcpy(setting->kbdlang, buf, length);
>> +       setting->kbdlang[length] = '\0';
>> +       return count;
> 
> Similar comments as per above.
Ack
> 
> ...
> 
>> +       char *set_str = NULL, *new_setting = NULL;
>> +       char *auth_str = NULL;
> 
> The rule of thumb is to avoid forward assignments on stack allocated
> variables. It may decrease readability, hide real issues, and simply
> be unneeded churn, like here. Please revisit all of them in entire
> series.
Covered in Hans reply. Leaving as is
> 
> ...
> 
>> +       /* Strip out CR if one is present */
>> +       strreplace(new_setting, '\n', '\0');
> 
> As per above.
> 
> ...
> 
>> +               /* Remove the value part */
>> +               strreplace(item, ',', '\0');
> 
> This is kinda non-standard pattern.
> 
> I would see rather something like
> 
> char *p;
> 
> p = strchrnul(item, ',');
> *p = '\0';
> 
> Yes, it's longer, but better to understand what's going on here.
Fair enough. I'll change. I quite liked the fact I had a one-liner do
the same thing - oh well :)
> 
>> +               /* Create a setting entry */
>> +               setting = kzalloc(sizeof(struct tlmi_attr_setting), GFP_KERNEL);
> 
> sizeof(*setting) ?
OK.

> 
>> +               if (!setting) {
>> +                       ret = -ENOMEM;
>> +                       goto fail_clear_attr;
>> +               }
>> +               setting->index = i;
>> +               strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
> 
> ...
> 
>> +       sprintf(tlmi_priv.pwd_admin->display_name, "admin");
>> +       sprintf(tlmi_priv.pwd_admin->kbdlang, "us");
> 
> Not sure why you need printf() type of function here. strcpy() or
> strscpy() should be enough.
OK - I can update.
> 
> ...
> 
>> +       if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_BUFSIZE))
>> +               pwdcfg.max_length = TLMI_PWD_BUFSIZE - 1;
> 
> Not sure if WARN_ON() is really what has to be called here. But I
> haven't checked the context deeply.
Covered in Hans' reply.. Leaving as is
> 
> ...
> 
>> +       sprintf(tlmi_priv.pwd_power->display_name, "power-on");
>> +       sprintf(tlmi_priv.pwd_power->kbdlang, "us");
> 
> As above.
Ack
> 
> ...
> 
>> +#ifndef _THINK_LMI_H_
>> +#define _THINK_LMI_H_
> 
> + linux/types.h
> 
> (At leas bool is from there)
Ack
> 
> 
>> +#endif /* !_THINK_LMI_H_ */
> 
