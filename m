Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C71C38142
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Jan 2023 23:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjAQXYX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Jan 2023 18:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjAQXX4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Jan 2023 18:23:56 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE54A45D5;
        Tue, 17 Jan 2023 13:17:06 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1673990224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CwRo+vqx7lsGAdCxZnp4PR6KcJNRCSVuz79Vo5hpT/c=;
        b=pUqlEQY7RAB4LOYhsb75FhYjstnm+Q4UGqEGCdZpw74Lv+HWHnSaglSEiqxpXUfAQUP8qF
        89v5BmsKARHNrxMaqabC+0Vv15+3PbKdxXnrt0xYxBm2DgOw8T2Wfr/jdsd5LYd3X89s27
        3JIDHlixeabWECQOus0E1vntodEgMlQWIeeFXayd3y3WfHtuP8cPyJ5AdmL2y3zsDnVC/4
        XqKpMAYPtmPC9uW+XtqZFe0iBDxt9W6iOqmvS3lIpcUmLlILP9xM+oKh/vz+wpDUGotLar
        INLlLv5uJvGIKlEuMzrSNX/H3f6+SWx7Z0dOrRU6qTEmUYbf/RBXzQTH41KC/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1673990224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CwRo+vqx7lsGAdCxZnp4PR6KcJNRCSVuz79Vo5hpT/c=;
        b=Z7KPACyVZicf25k3gLbejR2b8zwPfiR+rcW3tJXcnNvAw5ukjRGi44v/e84CxYqZVm9FRL
        ff2zoua9a9U3VNCA==
To:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     x86@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH v4 01/19] irqdomain: Drop bogus fwspec-mapping error
 handling
In-Reply-To: <20230116135044.14998-2-johan+linaro@kernel.org>
References: <20230116135044.14998-1-johan+linaro@kernel.org>
 <20230116135044.14998-2-johan+linaro@kernel.org>
Date:   Tue, 17 Jan 2023 22:17:03 +0100
Message-ID: <87cz7clv3k.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 16 2023 at 14:50, Johan Hovold wrote:
> In case a newly allocated IRQ ever ends up not having any associated
> struct irq_data it would not even be possible to dispose the mapping.
>
> Replace the bogus disposal with a WARN_ON().
>

This lacks a Fixes tag especially because this ends up in the dependency
chain of the race fixes.

Fixes: 1e2a7d78499e ("irqdomain: Don't set type when mapping an IRQ")

is not completely precise but close enough.

Thanks,

        tglx
