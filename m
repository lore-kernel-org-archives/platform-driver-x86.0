Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15623C43219
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 May 2022 21:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243007AbiERVAf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 May 2022 17:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242898AbiERVAR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 May 2022 17:00:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDCB2550AA;
        Wed, 18 May 2022 14:00:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B7D960B82;
        Wed, 18 May 2022 21:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BDCC34118;
        Wed, 18 May 2022 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652907608;
        bh=KcS5GI4xf1k64PlWdqRXj976hlEmI3j8PQlC7U+Rs4U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eVuCqyttWm3s81U5rgu5NjkkkKPWZdWATppI6afGf+VTj6TXIZN9Hwnl/7xhQky6Q
         mjYUJOcu6em4FApsXOHKPue2KsHmWzhc+HWL5AYO0uxdz+sr/bx7ykV7moJSeMLoMr
         rOLc7YHGgiapwNmZl3rk0/C6AdMPa3LrH0SZoZhG7ZjADck/eh7GTNp/3qOuk2kR55
         BGiboC/7kjN57A5+CH4VGeMVA8SANjbXWcjQ+AKS67mGzbq0kVi9m+mzdTdkYy9bbQ
         P/zbU3GCXC2OR2j9nOxsHu5mKM1e0EQNn31ZCjmTvi0Z0YRsfFy4nu7kTTZl2qJe+m
         bDMBDeYlT1nGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220503114607.98844-2-hdegoede@redhat.com>
References: <20220503114607.98844-1-hdegoede@redhat.com> <20220503114607.98844-2-hdegoede@redhat.com>
Subject: Re: [PATCH 1/1] platform/x86: Drop the PMC_ATOM Kconfig option
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Shevchenko <andy@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Gortmaker <paul.gortmaker@windriver.com>
Date:   Wed, 18 May 2022 14:00:06 -0700
User-Agent: alot/0.10
Message-Id: <20220518210007.E4BDCC34118@smtp.kernel.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Quoting Hans de Goede (2022-05-03 04:46:07)
> The def_bool y PMC_ATOM Kconfig option provides a couple of symbols used
> by the code enabled by the X86_INTEL_LPSS option and it registers some
> clocks. These clocks are only registered on Bay Trail, Cherry Trail and
> Brasswell Intel SoCs and kernels targeting these SoCs must always have
> the X86_INTEL_LPSS option enabled otherwise many things will not work.
>=20
> Building the PMC_ATOM code on kernels which are not targeting the
> mentioned SoCs and which do not have the X86_INTEL_LPSS enabled is
> not useful.
>=20
> This means that we can simplify things by replacing the PMC_ATOM Kconfig
> option in Makefiles with X86_INTEL_LPSS and then drop the option.
>=20
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
