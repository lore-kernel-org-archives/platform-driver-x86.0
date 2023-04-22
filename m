Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEB8C77B78
	for <platform-driver-x86@archiver.kernel.org>; Sat, 22 Apr 2023 20:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjDVU4X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 22 Apr 2023 16:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjDVU4W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Apr 2023 16:56:22 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2221610FD;
        Sat, 22 Apr 2023 13:56:18 -0700 (PDT)
Date:   Sat, 22 Apr 2023 22:50:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1682196660; bh=mf/Y9UC/Ll/EuFZXCOn4gWfN577y/uUXNOOmwZn7f+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HbhLY7X0tkYsGtl1IqEyqVH84wBg7GIpuKBbGAb3WMe7SwOHJ0f/dXLxSrTb5HZkO
         ODuYeie2apT0QNnlnZHrscvv8MivBCkhgl6vLuRGfZHwq8/Abaoc1vJAKQCmtFnseV
         sTngzQOGXJV3+5j/FhQ4e61GM5BQNOM8Oe24E/1g=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 01/14] HP BIOSCFG driver - Documentation
Message-ID: <dc902d52-7186-4095-9be9-60c728a24f05@t-8ch.de>
References: <20230420165454.9517-1-jorge.lopez2@hp.com>
 <20230420165454.9517-2-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420165454.9517-2-jorge.lopez2@hp.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-04-20 11:54:41-0500, Jorge Lopez wrote:
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  .../testing/sysfs-class-firmware-attributes   | 98 ++++++++++++++++++-
>  1 file changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 4cdba3477176..73d7b8fbc0b2 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -22,6 +22,12 @@ Description:
>  			- integer: a range of numerical values
>  			- string
>  
> +		HP specific types
> +		-----------------
> +			- ordered-list - a set of ordered list valid values
> +			- sure-start - report audit logs read from BIOS

In the treevie you sent the Sure_Start attribute does not have
a "current_value".
This indicated that it's not actually a firmware attribute but just some
standalone sysfs attribute.

In this case it should not be documented here, but handled the same way
as the SPM stuff.
