Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A67C47076
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 15:55:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FF28613E2
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 15:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhEUP5M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 11:57:12 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:13832 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231638AbhEUP5L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 11:57:11 -0400
Received: from [100.112.1.13] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 78/0D-49204-EF7D7A06; Fri, 21 May 2021 15:55:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleJIrShJLcpLzFFi42LJePGQV/ff9eU
  JBrvvClkc2nCAyaK7ey6TxZvj05ksPndMZrFYvecFs8Wij0/YHNg8Js2cwewx72Sgx/t9V9k8
  Pm+SC2CJYs3MS8qvSGDNmNn3ib3gmGzFmZZW1gbGAxJdjFwcQgL/GSV+X77PBuE8ZpSY2jGbq
  YuRk0NYoEji442zrCC2iIA6ULwHrIhZYAajxPyF31hAEkICC5kkPq6tAbHZBLQltmz5xQZi8w
  rYSpxdfY0RxGYRUJX4/qGZHcQWFQiX2N3xkgmiRlDi5MwnYHM4Bewkfvy6ABTnAFqgKbF+lz5
  ImFlAXOLWk/lMELa8xPa3c5hBbAkBRYnlk79B2QkSPf8esU1gFJyFZOoshEmzkEyahWTSAkaW
  VYxmSUWZ6RkluYmZObqGBga6hoZGuka6hsameolVukl6pcW6qYnFJbqGeonlxXrFlbnJOSl6e
  aklmxiBcZNSwNS+g7H1zQe9Q4ySHExKoryHzyxPEOJLyk+pzEgszogvKs1JLT7EKMPBoSTB++
  IaUE6wKDU9tSItMwcYwzBpCQ4eJRHe+MtAad7igsTc4sx0iNQpRkUpcd6/V4ESAiCJjNI8uDZ
  Y2rjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3Och2nsy8Erjpr4AWMwEtdi9fBrK4JBEh
  JdXApGjI/TbJ2+Qqz/J301N5RcT15zr/dRfacOIAg4nqMffqFb8ZORVKZR2WsthsSsvluZkYv
  fqe1L7IR9LzZ8t3yy89f/q85Tnx9F36rj9mx/I1821aeGX9w+1syaL6h2YzXONbsNv3vYi784
  dLijtUj4oE/NPXn5Zyd5twqZrXTKaD8QEPvl5cojE5letr/QXj/4s0El36VN4f2ldvkeCV/sL
  6/dZA4zkrt+l8O3kjrP/88fBbuy5NYknbP7Uy+MZiXR/W+Jds577f/Pn+7yptH+mWMLc4uxX1
  N4TrNkzoWHivIFe7rrL/Ua3Gi507pGbeylC2vihcMT35x/NUrg2/9lt+Cp5+bd+m1ZXMF6s89
  imxFGckGmoxFxUnAgDCgKJ+lgMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-8.tower-395.messagelabs.com!1621612542!239203!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28573 invoked from network); 21 May 2021 15:55:42 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-8.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 May 2021 15:55:42 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 1A2F24E40A1F1F265B52;
        Fri, 21 May 2021 11:55:42 -0400 (EDT)
Received: from [10.46.208.131] (10.46.208.131) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Fri, 21 May
 2021 11:55:41 -0400
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
        <divya.bharathi@dell.com>, <prasanth.ksr@dell.com>,
        <Dell.Client.Kernel@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
 <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <c8b706bb-5397-758e-8ab8-1d75b2920054@lenovo.com>
Date:   Fri, 21 May 2021 11:55:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.208.131]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2021-05-21 4:10 a.m., Hans de Goede wrote:
> Hi Mark,
> 
> On 5/20/21 7:18 PM, Mark Pearson wrote:
<snip>

>>>> + +	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;'
>>>> */ +	len = strlen(setting->password) +
>>>> strlen(encoding_options[setting->encoding]) +		+
>>>> strlen(setting->kbdlang) + 3 /* type */ +		+ strlen(new_pwd) +
>>>> 6 /* punctuation and terminator*/; +	auth_str = kzalloc(len,
>>>> GFP_KERNEL); +	snprintf(auth_str, len, "%s,%s,%s,%s,%s;", +
>>>> setting->pwd_type, setting->password, new_pwd, +
>>>> encoding_options[setting->encoding], setting->kbdlang); +	ret =
>>>> tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
>>> 
>>> So I guess on success any subsequent calls need to use the new
>>> password, so the user is expected to write the new password to
>>> the current_password file after changing the password this way?
>>> 
>>> I just checked the dell-wmi-sysman code and that does this:
>>> 
>>> /* clear current_password here and use user input from
>>> wmi_priv.current_password */ if (!ret) memset(current_password,
>>> 0, MAX_BUFF);
>>> 
>>> Where current_password points to either the user or admin cached
>>> password, depending on which one is being changed.
>>> 
>>> So that seems to work the same way as what you are doing here
>>> (the user needs to write the new password to current_password
>>> after changing it through the new_password sysfs attribute). Can
>>> you add a patch to the patch-set documenting this in
>>> Documentation/ABI/testing/sysfs-class-firmware-attributes ?
>>> 
>>> Also you may want to consider clearing out the old cached
>>> password on success like the Dell code is doing.
>>> 
>> Would you have any objections/concerns if, on a successful
>> password update, this function just updates the stored password
>> setting to the new password. Seems nicer from a user point of view
>> then having to go and feed the current_password field again. e.g:
>> strncpy(new_pwd, setting->password, TLMI_PWD_MAXLEN)
> 
> Please use strscpy, strncpy has horrible syntax and using it is easy 
> to get wrong.
> 
> e.g. the above example is wrong if strlen(new_pwd) >=
> TLMI_PWD_MAXLEN the resulting setting->password will not be 0
> terminated (and you seem to have swapped src and dst, but that is
> unrelated to strncpy being a sucky function).
Yeah, sorry, typed as an example only, and will use strscpy

> 
> This also make me realize that the code has 2 max-pwd-lengths:
> 
> setting->maxlen TLMI_PWD_MAXLEN
> 
> I think you should put a:
> 
> if (WARN_ON(pwdcfg.max_length > TLMI_PWD_MAXLEN)) pwdcfg.max_length =
> TLMI_PWD_MAXLEN;
> 
> in tlmi_analyze() so that we get a kernel-backtrace (and thus
> bugreports if this condition ever becomes true.
Sounds good
> 
> And then use pwdcfg.max_length everywhere (e.g. also for the check
> in current_password_store()).
> 
> Also the length checks in current_password_store() and
> new_password_store() should probably also check against
> settings->minlen ?
Agreed - will add
> 
> 
>> I know it would make Dell and Lenovo operate differently (I can add
>> that detail to the documentation) but it just feels like a nicer
>> design.
> 
> That works for me. Perhaps you can also do a (compile tested only)
> RFC patch for the Dell code to do the same thing (replace the memset
> 0 with the strscpy) to see if the Dell folks are ok with also doing
> things this way ?
> 
I'm not hugely comfortable with that. If for some reason it broke things
for Dell customers I wouldn't want to be responsible :) I'd rather they
made the changes and were able to test it - I know that's what I'd
prefer if it was the other way around. Apologies if I'm being over cautious!
I've added the new Dell kernel group email to the thread so they're aware :)

Mark
