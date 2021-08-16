Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44FFC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 11:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA0BD6323B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 11:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236348AbhHPLtU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 07:49:20 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:42855 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236598AbhHPLtT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 07:49:19 -0400
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id E8DF361E5FE02;
        Mon, 16 Aug 2021 13:48:45 +0200 (CEST)
Subject: Re: Dell laptop function keys stopped working between 5.10.46 and
 5.13.9
To:     Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <b8ff8f68-4d5a-7ec6-4c4f-9f5be6e70ab5@molgen.mpg.de>
 <1d4ce7d6-3213-45af-0467-7548f69b7d9e@molgen.mpg.de>
 <7857ead5-6ccf-3290-9e86-4f16d2bf360f@redhat.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <77ac6d35-9c9a-bab9-5203-47c814ec5fb8@molgen.mpg.de>
Date:   Mon, 16 Aug 2021 13:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7857ead5-6ccf-3290-9e86-4f16d2bf360f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Hans,


Am 16.08.21 um 12:34 schrieb Hans de Goede:
> Hi,
> 
> On 8/16/21 12:22 PM, Paul Menzel wrote:
>> [attach Linux 5.13.9 messages (output of `dmesg`)]
> 
> Does "lsmod" output include any Dell modules like dell-laptop or
> dell-wmi ?
> 
> How about on the 5.10 kernel?  It looks like the 5.13 kernel simply
> does not have these modules enabled / loaded.

Indeed. Good find. The Kconfig option was renamed, and Debian does not 
select it yet, so I submitted a report [1].



Kind regards,

Paul


[1]: https://bugs.debian.org/992251
