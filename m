Return-Path: <SRS0=fgui=DH=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530F4C4727F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Sep 2020 06:53:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 185562075F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Sep 2020 06:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="13qXVuXu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rwX7Kd1+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI3Gw7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Sep 2020 02:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3Gw7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Sep 2020 02:52:59 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CC8C061755;
        Tue, 29 Sep 2020 23:52:59 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601448776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=j2s3jXFKzGIzXdNeLusRWiNdaAym2uFmlShPg9vSRP8=;
        b=13qXVuXu/UlkQ0jsANvVF2tOQQ+edzm0rM2MIDTC5b6Py4d5Q4E+QaA99boqQiRo/bJqPY
        WHrqt7M9AYE5eyLeTGTH58b87GrfwNSo62nFA6x7CI+etaFrqgQ0uMtrOeOqiIn/4Z4DfT
        UeGzf/bSEJP3GyKcflSVqxl8+j7gXzunJoN6w8+5Bk7/BowFZkwsss2AQfwTL1qVkk8Ra8
        o173lo+ywyZKKIGz6WcLeB9mj4omEFxYjvzBd7yJ98jL+Hup8ag8g58lKlhqfm/Wa5XOQr
        RE/Yj+mvk8HXDXzCpedsS71glmT4gvyeajZ/qOZXD8Yrlz/Rbtw2LfWudS+KJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601448776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=j2s3jXFKzGIzXdNeLusRWiNdaAym2uFmlShPg9vSRP8=;
        b=rwX7Kd1+aVtWRDy+93l7JPKgeN8pbwZ3znaYZ8DGE124JO+pCrV8f5K2HRTp+5WbuOCI9f
        vz4IFnvaDQHOB9CA==
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86\@kernel.org H. Peter Anvin" <hpa@zytor.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] x86/uv/time: Replace one-element array and save heap space
In-Reply-To: <20200518190114.GA7757@embeddedor>
References: <20200518190114.GA7757@embeddedor>
Date:   Wed, 30 Sep 2020 08:52:56 +0200
Message-ID: <87sgaziwmv.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 18 2020 at 14:01, Gustavo A. R. Silva wrote:
> The current codebase makes use of one-element arrays in the following
> form:
>
> struct something {
>     int length;
>     u8 data[1];
> };
>
> struct something *instance;
>
> instance = kmalloc(sizeof(*instance) + size, GFP_KERNEL);
> instance->length = size;
> memcpy(instance->data, source, size);
>
> but the preferred mechanism to declare variable-length types such as
> these ones is a flexible array member[1][2], introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on. So, replace
> the one-element array with a flexible-array member.
>
> Also, make use of the new struct_size() helper to properly calculate the
> total size needed to allocate dynamic memory for struct uv_rtc_timer_head.
> Notice that, due to the use of a one-element array, space for an extra
> struct cpu:
>
> struct {
> 	int     lcpu;           /* systemwide logical cpu number */
> 	u64     expires;        /* next timer expiration for this cpu */
> } cpu[1]
>
> was being allocated at the moment of applying the sizeof operator to
> struct uv_rtc_timer_head in the call to kmalloc_node() at line 159:
>
> 159		head = kmalloc_node(sizeof(struct uv_rtc_timer_head) +
> 160			(uv_blade_nr_possible_cpus(bid) *
> 161				2 * sizeof(u64)),
> 162			GFP_KERNEL, nid);
>
> but that extra cpu[] was never actually being accessed due to the
> following piece of code at line 168:
>
> 168		head->ncpus = uv_blade_nr_possible_cpus(bid);
>
> and the piece of code at line 187:
>
> 187		for (c = 0; c < head->ncpus; c++) {
> 188			u64 exp = head->cpu[c].expires;
> 189			if (exp < lowest) {
> 190				bcpu = c;
> 191				lowest = exp;
> 192			}
> 193		}
>
> so heap space was being wasted.
>
> Another thing important to notice is that through the use of the
> struct_size() helper, code at line 161:
>
> 161		2 * sizeof(u64)),
>
> is changed to now be the actual size of struct cpu; see
> sizeof(*(p)->member) at include/linux/overflow.h:314:
>
> 314 #define struct_size(p, member, n)                                       \
> 315         __ab_c_size(n,                                                  \
> 316                     sizeof(*(p)->member) + __must_be_array((p)->member),\
> 317                     sizeof(*(p)))
>
> As a side note, the original developer could have implemented code at line
> 161: 2 * sizeof(64) as follows:
>
> sizeof(*head->cpu)

This changelog is an unparseable pile of word salad wasting brain heap
space.

The gist is:

    Variable sized arrays at the end of a struct should be defined as
    unsized array foo[] not as foo[1].

    struct uv_rtc_timer_head contains a sized array cpu[1].

    Switch it to an unsized array and use the struct_size() helper to
    calculate the allocation size.

Thanks,

        tglx


    
