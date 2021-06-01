Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DDDC47096
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 18:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2E4561375
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 18:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbhFASMs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234589AbhFASMr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 14:12:47 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CA5C06175F
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Jun 2021 11:11:05 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id h20so15212757qko.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Jun 2021 11:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=wRwteCaGKZ10e8+sBtL3qGET4PztXqRbJxpQswQ1wZ4=;
        b=Xf7CSrcx0gZc/sw/u32fm4fDbUmIKsXJ/VYY3b6I2TINji/gEViOo0+/3eu+yW9Qgd
         fIGeNKOgrvvoXSlKowbNVeKQqeYrgIx8R+UG5xh83h5SLOwv/5uFjJDNSoddC30OLOAP
         eeb77BNO0SGqOxoLj3XL020OBNHpc15BDfmueLRDjJQfWJptI6v5o1b1rHvOJRAOVKlt
         VNpNaJpcQ4vHbnLaPIFMaxp4PkgtqZM58T+bwUwvwAp24ndzjiN27Y317PjL5UaZhW2A
         4MHWVeTTB4dK7LEaSj2Ky8gxJUKpLuudM6imShkOBqj5RMusHaTKIjTFUXCuCa94uHDl
         W5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=wRwteCaGKZ10e8+sBtL3qGET4PztXqRbJxpQswQ1wZ4=;
        b=U4dkCwPyFMVNVAjIpEZaQAJzq4fYeSPml9choFNccYQSrdLlgnmA17uQKHX5i+NQqd
         YvTZeiiZfvnQZKCdjzeetxi5ut9tcpFPPI6bQZJJPB2xsKebUaoo5iSFUDQ3oMYKDP7D
         08eEaGuJSYBmPwLd02mTgNrn9sYzZ+cDRtJmD/OAOjoroJBw+dIsdqypg49MlZ8N+J2u
         IiMw2HTOMl8Iog2nAdzPiX2Use0DfGztKCERSfvmMtoHWlJBsLIeLytNyjj9GVPyx9Uv
         oamz1LiDpxdZs3oG3bc8VRqmtUiQwtIY3GyXkwH7Xaiataphy5VbGWPPPARdxwV3fSvX
         fPIQ==
X-Gm-Message-State: AOAM532L50E8mvgYkclh9Z8OO7Wys4CuUHw6Rb2oTfIquy45ajiY6zph
        zcUZgVybXqKFV1GTVPUxkTlAZw==
X-Google-Smtp-Source: ABdhPJyH06WMNFVFIh2tqA2mZ/X7OLcXSDF3vAAIrUB8u/TcRWHA6zy5sI+bX9Bd1/r6Bup6LtlwYg==
X-Received: by 2002:a37:91c2:: with SMTP id t185mr23666624qkd.430.1622571063443;
        Tue, 01 Jun 2021 11:11:03 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id g5sm10470430qtv.56.2021.06.01.11.11.01
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 01 Jun 2021 11:11:03 -0700 (PDT)
Date:   Tue, 1 Jun 2021 11:10:49 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Mike Rapoport <rppt@kernel.org>
cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Andy Shevchenko <andy@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Darren Hart <dvhart@infradead.org>,
        Dave Young <dyoung@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Lianbo Jiang <lijiang@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/3] x86/setup: always resrve the first 1M of RAM
In-Reply-To: <20210601075354.5149-1-rppt@kernel.org>
Message-ID: <alpine.LSU.2.11.2106011109020.1045@eggly.anvils>
References: <20210601075354.5149-1-rppt@kernel.org>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 1 Jun 2021, Mike Rapoport wrote:
> 
> Randy, Hugh, I'd appreciate if you give this a whirl on your old Sandy
> Bridge laptops as it changes again the way trim_snb_memory() works.

Boots and runs fine here, i386 or x86_64: thanks for remembering us!

Hugh
