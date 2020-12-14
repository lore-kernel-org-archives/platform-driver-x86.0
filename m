Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFDAC4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Dec 2020 23:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DEEF20731
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Dec 2020 23:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgLNXuU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Dec 2020 18:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgLNXuT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Dec 2020 18:50:19 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF37BC06179C;
        Mon, 14 Dec 2020 15:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=vucjdQCLyAd3Q0AdZs6xHlknqACs9Tp5nQldv2CB1TU=; b=qIr4fpcCqB3zbFi3ySlzcZp0ZX
        vD0DiVNJsS3n6o6Xl4V+jBmK1kPukdAjKZN62wYsz98OY2WGnDVcAeGcTgb8GIP9LAPhuOfG+I16J
        YEnhGQjNWYf3UdkPzpdF5TbDMJPcHkGPxXArzYo/Qugm/RTSAqpBbZtiQbUHt7s0NlHae7qYBlVi3
        CGzdUhoR6HmBuale0d4+F/kxOGff1i3/I4xwP14uo9EUke4r6564WhGx5t8pXvj0RGcpnphNVEaU+
        WgdsfmFMolAR5Qk3paKUBOX6n65O8ZyXsXrA8i5BDGQeHGrivK5/NHwqH8HAMGepLSwG8KU+XtyNv
        iO8kOqlA==;
Received: from [2601:1c0:6280:3f0::1494]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1koxay-0008LS-K6; Mon, 14 Dec 2020 23:49:36 +0000
Subject: Re: [PATCH -next] platform: surface: fix non-PM_SLEEP build warnings
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20201211190335.16501-1-rdunlap@infradead.org>
 <CAHp75Vcckb5NA=tc5s5p_qzYE2qhJOT0vhCtfKhT_eqZe+PgXw@mail.gmail.com>
 <ec8e703f-e1ea-1253-edc9-311f0ee3e8fd@infradead.org>
 <CAHp75Vf-QcdL+FOd=8fUUQ0+ORC-RVKG+3Yqrar1J7wZMSDF+A@mail.gmail.com>
 <3d5a5c8f-4bb1-6205-ae76-354473d59a18@infradead.org>
 <CAHp75Vc3_ye3Ph0uVYdcsKr0QY5RGSaHmCgU1A2q-U2GCAafsQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0f07d6b8-6a28-ba31-9cfa-53abffb0c0ff@infradead.org>
Date:   Mon, 14 Dec 2020 15:49:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc3_ye3Ph0uVYdcsKr0QY5RGSaHmCgU1A2q-U2GCAafsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 12/14/20 3:19 AM, Andy Shevchenko wrote:
> On Mon, Dec 14, 2020 at 2:53 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 12/12/20 11:07 AM, Andy Shevchenko wrote:
>>> On Sat, Dec 12, 2020 at 7:05 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> ...
> 
>>> Here [1] is the rationale behind annotation vs. ifdeffery.
>>>
>>> [1]: https://lore.kernel.org/patchwork/patch/732981/
>>>
>> Thanks for the link.  I'll send a v2.
>>
>> Could we add that to the Linux BKP (Best Known Practices)
>> document?
> 
> Perhaps. The author of that is Arnd, maybe he has something to add.
> 

Where is it located?  My search foo could not find it.

thanks.
-- 
~Randy
