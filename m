Return-Path: <SRS0=p7YD=EK=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFE8C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 02:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14271206F9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 02:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=codon.org.uk header.i=@codon.org.uk header.b="W1Ro/Ic8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729682AbgKDCID (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 21:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgKDCID (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 21:08:03 -0500
X-Greylist: delayed 1115 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 03 Nov 2020 18:08:03 PST
Received: from cavan.codon.org.uk (cavan.codon.org.uk [IPv6:2a00:1098:0:80:1000:c:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65825C061A4D;
        Tue,  3 Nov 2020 18:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codon.org.uk; s=63138784; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=haG2ZVbSNVy/a9QtykVytx6aYy619a3LWgcR1jjBfP8=; b=W1Ro/Ic85z6+lWrArFTlHaQ7E
        Lyhi0PPbkn1+7Wh/lpodBdCiNrSP8iwol2H5Ertub10l2oCFfykPAMaklP3AHcK8Uy8AJ3VEACPBr
        y6ke+aDsoSsm62i5HCKv6R5eHvVjqXOZowCS/ZIFcwcuzwSENM7nCOsEwMRC0Ld7H2S0Y=;
Received: from mjg59 by cavan.codon.org.uk with local (Exim 4.89)
        (envelope-from <mjg59@cavan.codon.org.uk>)
        id 1ka7vI-0007lG-2Y; Wed, 04 Nov 2020 01:49:16 +0000
Date:   Wed, 4 Nov 2020 01:49:15 +0000
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     Perry Yuan <Perry.Yuan@dell.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, pali@kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Limonciello Mario <Mario.Limonciello@dell.com>
Subject: Re: [PATCH]  platform/x86: dell-privacy: Add support for new privacy
 driver
Message-ID: <20201104014915.45tbmnrqvccbrd2k@srcf.ucam.org>
References: <20201103125542.8572-1-Perry_Yuan@Dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103125542.8572-1-Perry_Yuan@Dell.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: mjg59@cavan.codon.org.uk
X-SA-Exim-Scanned: No (on cavan.codon.org.uk); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Nov 03, 2020 at 04:55:42AM -0800, Perry Yuan wrote:

> +#define PRIVACY_PlATFORM_NAME  "dell-privacy-acpi"
> +#define ACPI_PRIVACY_DEVICE	"\\_SB.PC00.LPCB.ECDV"

This looks like the EC rather than a privacy device? If so, you probably 
want to collaborate with the EC driver to obtain the handle rather than 
depending on the path, unless it's guaranteed that this path will never 
change.

> +static int micmute_led_set(struct led_classdev *led_cdev,
> +               enum led_brightness brightness)
> +{
> +    acpi_status status;
> +
> +    status = acpi_evaluate_object(NULL, ACPI_PRIVACY_EC_ACK, NULL, NULL);
> +    if (ACPI_FAILURE(status)) {
> +        dev_err(led_cdev->dev, "Error setting privacy audio EC ack value: %d\n",status);
> +        return -EIO;
> +    }
> +    return 0;
> +}

What's actually being set here? You don't seem to be passing any 
arguments.

> +static const struct acpi_device_id privacy_acpi_device_ids[] = {
> +    {"PNP0C09", 0},

Oooh no please don't do this - you'll trigger autoloading on everything 
that exposes a PNP0C09 device.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
