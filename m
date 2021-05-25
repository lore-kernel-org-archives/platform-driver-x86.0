Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD53C2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:50:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E4506140F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhEYQwJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 12:52:09 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:28049 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbhEYQwF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 12:52:05 -0400
Received: from [100.112.2.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 05/A4-49204-ADA2DA06; Tue, 25 May 2021 16:50:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleJIrShJLcpLzFFi42JJl3vFrntLa22
  CQecTLouXEw4zWnR3z2WyeHN8OpPF547JLBar97xgtlj08QmbA5vHpJkzmD12zrrL7jHvZKDH
  +31X2Tw+b5ILYI1izcxLyq9IYM348v8kY8FykYoZT96xNDA+5e9i5OQQEvjPKLH7EV8XIxeQ/
  ZhRYt3fw+wgCWGBIomPN86ydjGyc4gI6EvsLwMpYRa4yihxf/YrRoj640wSR37eA6tnE9CW2L
  LlFxuIzStgK9F0dzsLiM0ioCrxYvIesBpRgXCJ3R0vmSBqBCVOznwCVsMpEChx9+8sIJsDaIO
  mxPpd+iBhZgFxiVtP5jNB2PIS29/OYQYpkRBQlJj4TRckLCGQINHz7xHbBEbBWUiGzkIYNAvJ
  oFlIBi1gZFnFaJZUlJmeUZKbmJmja2hgoGtoaKRrrGtkaqiXWKWbpFdarJuaWFyiC+SWF+sVV
  +Ym56To5aWWbGIExk5KAfPvHYxdbz7oHWKU5GBSEuWV8l+dIMSXlJ9SmZFYnBFfVJqTWnyIUY
  aDQ0mCVxwYjUKCRanpqRVpmTnAOIZJS3DwKInw3tQESvMWFyTmFmemQ6ROMSpKifPaKwAlBEA
  SGaV5cG2w1HGJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvMpDxPJl5JXDTXwEtZgJanJSz
  CmRxSSJCSqqBSWTrmgm1d7as+tF+dia36+ON1460TOXIy2rPfHOpM5NVkn++F9v0k56Pzlzpu
  a2Wo6R/zti1v7Dmn8Mc9h9mxtzL3vi5zvzs7mr3Rjnu1tdLE87H8i1bm/bxxKbpvgY6EoqHtM
  VYw358+H01ZvEq994Tzi2THpk+D5bVinQX/vuwi+v9JUm16etfBU5ddej6jFc///ssZLtQtO6
  +r+zFPW/ljcy1BA4op3e9XRhxT8Lt2oETE0ofcZi93L5z6cP7j8+rP5Sw1zl7sahpi+3kt51M
  Mtl62zob9ofULaw/e5D9ruGH7n237HLOH3nY/nbVzL93JZY+ffP3Ebfj9YUb5q262+H1rPOyj
  pf27cALy96cUWIpzkg01GIuKk4EAInseZ2YAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-8.tower-395.messagelabs.com!1621961432!29536!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27099 invoked from network); 25 May 2021 16:50:33 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-8.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 May 2021 16:50:33 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id B7198AC320FAFACEC851;
        Wed, 26 May 2021 00:50:30 +0800 (CST)
Received: from [10.46.192.114] (10.46.192.114) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Tue, 25 May
 2021 12:50:28 -0400
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <CAHp75VfM=Vv2pe=KNYQO_hf_8Ya-m8QH481xnu+OPoZL-p8TSA@mail.gmail.com>
 <f13956b5-511e-1793-c089-6f72628ea7a8@lenovo.com>
 <CAHp75VduaxS7XtcxthFts8rF2stYR3w26527_kJj_+m-XvS-NA@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <1782b513-9cf1-40cb-1dc3-f24c68eb9bdc@lenovo.com>
Date:   Tue, 25 May 2021 12:50:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VduaxS7XtcxthFts8rF2stYR3w26527_kJj_+m-XvS-NA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.114]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Andy

On 2021-05-25 12:18 p.m., Andy Shevchenko wrote:
> On Tue, May 25, 2021 at 6:14 PM Mark Pearson <markpearson@lenovo.com> wrote:
>> On 2021-05-22 7:04 a.m., Andy Shevchenko wrote:
>>> On Sun, May 9, 2021 at 5:02 AM Mark Pearson <markpearson@lenovo.com> wrote:
> 
> ...
> 
>>>> +       *string = kstrdup(obj->string.pointer, GFP_KERNEL);
>>>> +       kfree(obj);
>>>> +       return *string ? 0 : -ENOMEM;
>>>
>>> This breaks the principle "don't touch the output in error case".
>>
>> But I'm not changing *string in an error case here - I'm not
>> understanding the issue here.
>> Happy to rewrite it to make it clearer though if that would help.
> 
> *string may be not NULL when you do assign it.
> You need to assign it iff you are about to return 0.
Ah - got it. I'll fix.

> 
> ...
> 
>>>> +       length = strlen(buf);
>>>> +       if (buf[length-1] == '\n')
>>>> +               length--;
>>>
>>> This will prevent you from using \n in the password. Why?
>> The BIOS doesn't like it - so we strip it out :)
> 
> I haven't checked, but if there is no description of this in the
> documentation/commit message, should be added.
Ack.
> 
> ...
> 
>>>> +       memcpy(setting->password, buf, length);
>>>
>>>> +       setting->password[length] = '\0';
>>>
>>> Why is the password a *string*? From where that assumption comes from?
>> Sorry, I'm not understanding the question here. It's what our BIOS is
>> expecting. I'm missing something here
> 
> So, BIOS restrictions should be documented if not yet.
Ack
> 
> ...
> 
>>>> +       /* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
>>>> +       len = strlen(setting->password) + strlen(encoding_options[setting->encoding])
>>>> +               + strlen(setting->kbdlang) + 3 /* type */
>>>> +               + strlen(new_pwd) + 6 /* punctuation and terminator*/;
>>>> +       auth_str = kzalloc(len, GFP_KERNEL);
>>>> +       snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
>>>> +                setting->pwd_type, setting->password, new_pwd,
>>>> +                encoding_options[setting->encoding], setting->kbdlang);
>>>
>>> NIH of kasprintf()
>> Not sure what NIH is -
> 
> https://en.wikipedia.org/wiki/Not_invented_here
Neat :)
> 
>> but I'm assuming I should be using kasprintf
>> instead of snprinf :)
>> I wasn't aware of it - thank you.
> 
> strlen+kmalloc+sprintf == kasprintf
> 
> ...
> 
>>> The terminator line doesn't need a comma.
>> Argh. I always get this wrong as to when it is required and when it isn't.
>> I'll fix
> 
> If it is supposed to be the last entry (i.o.w. terminator) --> no comma.
> 
Thanks
