Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9717DC7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbjC0Nva (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjC0NvK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:51:10 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183EF5BB0;
        Mon, 27 Mar 2023 06:50:08 -0700 (PDT)
Date:   Mon, 27 Mar 2023 13:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1679924987;
        bh=HuAQY9cUNYKiY456VLKupDVSaGAACUJrfQ2QV2UFyeU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BAvxBmN4NC7FS0xKdwb6lVYVEyRHLsgQ2UBd3Jt/ddKhFU8+VfxA3+vsV04OKCjVl
         289z4qpgUFKtFc1UrC3Vo1yWy8dpeSO+dqKAYgbEP4DmOSqgsIHLuo0POlYAYAF/0K
         LACi6zllqMK3HPhjOHdVSkX5b+gLPYRqiaX9+c7Q=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] platform/x86: gigabyte-wmi: remove allowlist
Message-ID: <517f2742-75c6-4f1e-ad97-6a4a4328e74b@t-8ch.de>
References: <20230325-gigabyte-wmi-unrestrict-v1-1-23771309a4d3@weissschuh.net>
 <dc1ba9f1-549f-ef27-6a49-e288d41893d2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc1ba9f1-549f-ef27-6a49-e288d41893d2@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-03-27 15:15:06+0200, Hans de Goede wrote:
> Hi Thomas,
> 
> On 3/25/23 17:48, Thomas Weißschuh wrote:
> > Having to maintain a per-system allowlist is burdensome and confusing
> > for users, drop it.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > 
> > I propose to keep this in -next for two cycles or so to make sure it
> > does not break anything.
> 
> I think dropping this is a good idea (given the current experience with
> the driver), but keeping the dropping of the list in -next for 2 cycles
> is somewhat tricky. Normally once the final e.g. 6.3 is released I take
> the pdx86/for-next branch *as-is* and use that to send a pull-req to
> Linus, so that Linus gets send a hash which has been tested in linux-next
> for a while before sending it to him.
> 
> Dropping this patch at that point would mean generating a new hash,
> which is a bit meh. I can do that but I would prefer to just limit
> testing to 1 full cycle.
> 
> Maybe you can send me a non RFC version of this patch once 6.4-rc1 is out?
> Then I can add that to for-next right away and then we can get a full
> cycle of -next testing that way.
> 
> Would that work for you?

Absolutely, will do.

Thanks,
Thomas
