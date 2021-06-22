Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD47C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEAF86109E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:04:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhFVUGo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:06:44 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.113]:57450 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232617AbhFVUGo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 16:06:44 -0400
Received: from [100.112.134.71] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-west-2.aws.symcld.net id 4B/90-23301-B4242D06; Tue, 22 Jun 2021 20:04:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRWlGSWpSXmKPExsWS8eIhj66306U
  Eg6U3+CzeHJ/OZLF4/TJGi88dk1ksVu95wezA4tF66S+bx7yTgR7v911l8/i8SS6AJYo1My8p
  vyKBNWP1g9WMBduEK85ffsjYwHhfoIuRi0NI4D+jxI31z5khnMeMEpdPv2PtYuTkEBaIk/j86
  QATSEJE4ASjxP7lh1kgqhYySixtfcoOUsUmoC2xZcsvNhCbV8BW4uTbl8wgNouAqsTlr19YQG
  xRgQiJhzu3MELUCEqcnPkEKM7BwSlgLXH0ZD2IySygKbF+lz5IBbOAuMStJ/OZIGx5ieats8E
  mSggoSjzfup8Jwk6Q6Pn3iG0Co8AsJENnIUyahWTSLCSTFjCyrGK0SCrKTM8oyU3MzNE1NDDQ
  NTQ00jU0NtY1MjTWS6zSTdIrLdYtTy0u0TXSSywv1iuuzE3OSdHLSy3ZxAiMh5SC1qs7GOe8+
  aB3iFGSg0lJlLdD81KCEF9SfkplRmJxRnxRaU5q8SFGDQ4OgRnn5k5nkmLJy89LVZLg3WkPVC
  dYlJqeWpGWmQOMWZhSCQ4eJRFefUegNG9xQWJucWY6ROoUo6KUOK8rSEIAJJFRmgfXBksTlxh
  lpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8waBTOHJzCuBm/4KaDET0GKF3xdBFpckIqSkGpic
  J2R8e/pn8Yfl50rmHe2xvl66ds3WjPiEtc39vB86v1au9rDs2Ofu+/jPz9gv4SFOU9Q/+E0wn
  rH7g8QXNoHCXTtfGV2wnWF3L7sscOUu1c63uuVh99+5pLKvrxRLZbF9JnvTdvazqwfyN3JffD
  H7zaGSJ3lZ+imyR24Yrtt9mkflp9ITocY3/xaE8Ggy/fSymsbpsfrtH1fF2Y/t2nv6Pyverpz
  IoCMnVijHnPS9UVwvmM3j2p3PsvsNqmNFs2KueG9Vmpv9JovpD0+mqGV9p+T5eZZsMvIxnAsb
  H6zfrc7x/XjrBIM/oqs6vXOfvHh+SHoXS8mD8EnL5p79vfAb16cTsY8XPanbvJa1bdYsJZbij
  ERDLeai4kQA2Sfk3Y4DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-346.messagelabs.com!1624392266!6443!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18290 invoked from network); 22 Jun 2021 20:04:27 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-19.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jun 2021 20:04:27 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 0D7518EFEE2EE328DBC3;
        Tue, 22 Jun 2021 16:04:26 -0400 (EDT)
Received: from [10.46.192.197] (10.46.192.197) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Tue, 22 Jun
 2021 16:04:25 -0400
Subject: Re: [External] [PATCH] platform/x86: think-lmi: Fix issues with
 duplicate attributes
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210622175516.10100-1-mario.limonciello@amd.com>
 <97b375ca-6801-2872-33dd-5591cace578d@lenovo.com>
 <5ccd181e-dcc0-2e80-51c2-11709f60e999@amd.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <9a0cfd37-1c53-1e70-742b-7515b770c299@lenovo.com>
Date:   Tue, 22 Jun 2021 16:04:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5ccd181e-dcc0-2e80-51c2-11709f60e999@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.46.192.197]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-06-22 3:58 p.m., Limonciello, Mario wrote:
> On 6/22/2021 14:55, Mark Pearson wrote:
>>
>> On 2021-06-22 1:55 p.m., Mario Limonciello wrote:
>>> On an AMD based Lenovo T14, I find that the module doesn't work at
>>> all, and instead has a traceback with messages like:
>>>
>>> ```
>>> sysfs: cannot create duplicate filename
>>> '/devices/virtual/firmware-attributes/thinklmi/attributes/Reserved'
>>> ```
>>>
>>> Check for duplicates before adding any attributes.
>>>
>>> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface
>>> support on Lenovo platforms")
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/platform/x86/think-lmi.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/think-lmi.c
>>> b/drivers/platform/x86/think-lmi.c
>>> index d2644230b91f..b029d4a5bc3c 100644
>>> --- a/drivers/platform/x86/think-lmi.c
>>> +++ b/drivers/platform/x86/think-lmi.c
>>> @@ -691,6 +691,13 @@ static int tlmi_sysfs_init(void)
>>>           if (!tlmi_priv.setting[i])
>>>               continue;
>>>   +        /* check for duplicate */
>>> +        if (kset_find_obj(tlmi_priv.attribute_kset,
>>> tlmi_priv.setting[i]->display_name)) {
>>> +            pr_debug("duplicate attribute name found - %s\n",
>>> +                tlmi_priv.setting[i]->display_name);
>>> +            continue;
>>> +        }
>>> +
>>>           /* Build attribute */
>>>           tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
>>>           ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj,
>>> &tlmi_attr_setting_ktype,
>>>
>> Thanks Mario - I don't think I'd tested it on the T14 AMD yet.
>>
>> Change looks good to me
>> Mark
>>
> 
> In further testing this is causing problems on unload (or there was
> already another problem). So Hans please hold off, I'll work out what's
> happening and send a follow up v2.
> 
> Mark - something I'm wondering though what does "Reserved" even mean?
> Should that really be exported?  Or should it be part of a dis-allow list?
> 
> 
As an aside, I did test unload so it was working previously.

I'll need to check this out to see what's going on - it's quite possible
the T14 AMD is giving you duplicate items. I'll do some digging. My
guess is "Reserved" is probably not something we're supposed to
configure - but it's just a guess

Mark
