Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6733C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Jul 2021 17:40:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B4D60F42
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Jul 2021 17:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG2RkS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Jul 2021 13:40:18 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.112]:25140 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229565AbhG2RkR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Jul 2021 13:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1627580413; i=@lenovo.com;
        bh=/YVWICU/6fFa6xyAYlBr0bJCtw0TIdSo7TaQIncL0k8=;
        h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=hxAAlwKbhjNOGcIcJQ71oeAvlur3OgT4w4NjMsTqefy7MlA7nhrN8TQ3wlLNaDMrN
         TZGVwjF0RMlkYyicilP+oPw0je7Jq2TsQdxnjXKs4eZ/6urgQaVySgSNBDvEPpJMqt
         vsovUjgRNxBt4PozY9vjZYZN+Q0B6FeuXiTElWJuyxVBOm6yIf2g9zm8DrnOchSu1u
         rrmjeJnPYGhOrnVGbFncCVTQmzGl2xxJr+GRl2vp52+1hq4ue2NVB/YEzu5Ef5Asyu
         BQZldJ6/yGOU5G3nLGuYw7gItF5+GTDzITAgeRGhBhnXUaxWd1XbFA+pv5QqaQIKYW
         ySuxlSpHdKbjQ==
Received: from [100.112.6.224] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-east-1.aws.symcld.net id 87/D9-03958-DF7E2016; Thu, 29 Jul 2021 17:40:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsWSLveKXffvc6Z
  Eg8dqFm+OT2ey+NwxmcVi9Z4XzA7MHvNOBnq833eVzePzJrkA5ijWzLyk/IoE1ozPS1YzFrwU
  qZjQndfA+Eagi5GLQ0jgP6PE5u1/2SGc54wSOz/uYe5i5OQQFoiQ2NV0nR3EFhFQl5ja0cMGY
  jMLOEtMapkAZgsJvGeUWPvUEcRmE9CW2LLlF1Ccg4NXwFZiwvQwkDCLgKrEhxezwMpFgUY+3L
  mFEcTmFRCUODnzCQuIzSlgJ7Hk0mFGiPEWEjPnn4eyxSVuPZnPBGHLS2x/OwfsNAkge9L896w
  QdoJEz79HbBMYBWchGTsLyahZSEbNQjJqASPLKkazpKLM9IyS3MTMHF1DAwNdQ0MjXXNdQwtj
  vcQq3WS90mLd1MTiEl1DvcTyYr3iytzknBS9vNSSTYzAWEgpYN++g3Hhmw96hxglOZiURHmTD
  zElCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgbX0GlBMsSk1PrUjLzAHGJUxagoNHSYS39jFQmr
  e4IDG3ODMdInWKUVFKnPfxU6CEAEgiozQPrg2WCi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52B
  UEubVBNnOk5lXAjf9FdBiJpDFJYwgi0sSEVJSDUwsLn8nJLxPW7/nu1aF9Zt4tjML40KY/0xV
  ffbN7+QUlkLFgFxrQbFlPs+kXlmYvXi0fFFapbY1u9OZzJfCW4y1JKSakh13se1ecXvltqpEt
  zhuh+Bv9Zu2FCwN/7BDh/UFH/PCpbx/folNrWHUOKqbnlvocTTCbM6yFwXSYtNVeL9sYdkgXH
  ztmtujt0FFLFkbH036J1XgXn3x24p97bZGB2Tzbf5bRs007+GJyV/6wXVZ9/+HYtN/3jtvV7T
  FcOftiWes52eZuFXavE3/8uXrzOWcxs5mE+8VXFTNm+u5RjHbbeEkmx37bPb1/TrxJDnxdE+6
  qqRj2ZybEUdtJzpNzDvEVum2cb9h8ES9sx5KLMUZiYZazEXFiQAlTNw1gAMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-406.messagelabs.com!1627580411!116039!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6695 invoked from network); 29 Jul 2021 17:40:12 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-6.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 17:40:12 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 2BC4353B027DF484F3DD;
        Fri, 30 Jul 2021 01:40:09 +0800 (CST)
Received: from localhost.localdomain (10.38.55.64) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Thu, 29 Jul
 2021 13:40:07 -0400
Subject: Re: [External]Re: [External]Re: [PATCH] platform/x86: think-lmi: add
 debug_cmd
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210715230850.389961-1-markpearson@lenovo.com>
 <4e59c26c-d58b-dfd5-ed21-f9cd83fc43b6@redhat.com>
 <fc392326-9d19-dc78-bf06-da85b3b53fb2@lenovo.com>
 <985c01bb-76f4-a7c1-e614-470cb5009576@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <76a0aa55-c778-2398-dd31-c4a53a373a09@lenovo.com>
Date:   Thu, 29 Jul 2021 13:40:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <985c01bb-76f4-a7c1-e614-470cb5009576@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.55.64]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans

On 2021-07-29 1:34 p.m., Hans de Goede wrote:
> Hi Mark,
> 
> On 7/19/21 2:46 PM, Mark Pearson wrote:
>> Thanks for the review Hans
>> 
>> On 2021-07-17 9:59 a.m., Hans de Goede wrote:
>>> Hi Mark,
>>> 
>>> On 7/16/21 1:08 AM, Mark Pearson wrote:
>>>> Many Lenovo BIOS's support the ability to send a debug command
>>>> which is useful for debugging and testing unreleased or early
>>>> features. Adding support for this feature.
>>>> 
>>>> Also moved the pending_reboot node under attributes dir where
>>>> it should correctly live. Got that wrong in my last commit and
>>>> realised as I was updating the documentation for debug_cmd
>>>> 
>>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>> 
>>> Thank you for the patch, I'm not entirely sure if we want this in
>>> its current form though, isn't this new debug_cmd file not
>>> something which would be better under debugfs ?  Or maybe have it
>>> only show up if a module parameter is passed to enable it ?
>>> 
>>> Note that both have implications wrt secureboot. debugfs is only 
>>> writeable when secureboot is disabled; and ATM module options
>>> are not protected by secureboot, but at least in Fedora we would
>>> actually like to change that in the future.
>>> 
>>> Anyways, lets discuss this a bit further and then merge
>>> something for this later.
>>> 
>> I wasn't sure about debugfs but did consider it. It seemed to be
>> adding a whole extra layer. I'm happy to do that if that's what is
>> recommended but not having it available with secureboot could be
>> annoying for users.
> 
> I agree that adding debugfs support just for a single file seems a
> bit overkill.
> 
>> This feature is mostly used internally (which is fine) but we have
>> had occasions where we've used it with customers; and with the WMI
>> interface it's usually the enterprise customers who do have secure
>> boot enabled. I'd like to avoid that limitation if possible.
> 
> So given that using debugfs seems a bit overkill and it has issues
> with selinux I think that it might be best to hide this file behind a
> module option (and mention that in the docs, or maybe not document it
> at all?).
> 
> At least for now kernel commandline options an be set without
> breaking secureboot and even if secureboot ever starts verifying the
> cmdline then we can always use a /etc/modprobe.d/*.conf file to
> specify the option instead of passing it through the kernel cmdline.
> 
> Would using a module option to enable the debug_cmd file work for you
> ?
> 

That sounds very sensible to me - totally happy to do that.
I'll get that implemented when I'm back from PTO and send as an update.

Thanks!
Mark

