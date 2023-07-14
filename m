Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA688EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 02:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjGNCOI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 Jul 2023 22:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjGNCOH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Jul 2023 22:14:07 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7942702
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jul 2023 19:14:05 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 874AD5C00B0;
        Thu, 13 Jul 2023 22:14:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 13 Jul 2023 22:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1689300841; x=1689387241; bh=iI
        kfDo9QuBbLs+cml96Wkuky3Mb0GE+5l829dl4UbRA=; b=D6oRXB5D/8zIXjkFc5
        ZsX1ApS8L6EnbXxS8UrRXgtSYEQwSX2wOJxQFBLCoavORpqVE1NHcO1+UD+vqJRa
        LE+6TBnRJf0WOJ5RA8RnWOgLtNGdwH2dO/kiRsI3B/feu2GtX0JhRgt9R1aRtf0Y
        fWQahATNzrconk/P+5K7wx3LngZslpVnH9hzEHsaae4/Tqcm/dnLnWRJ4HToRy19
        SmpHSdpUacnpYNDyyCnOcf6s3+fEy/HVQawtkBaHZ0of1rmRSZkU02iqUk0BuCLF
        BlWbnSDcq6nEpBpWMkpjApFpJ4hCZegW8tcR3dFPUy1szvn0hR3LoM47H74NNnwg
        /czg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1689300841; x=1689387241; bh=iIkfDo9QuBbLs
        +cml96Wkuky3Mb0GE+5l829dl4UbRA=; b=MssAEUNGtKRsC6zH19ZqRGAbK0IEh
        ztRwd4L4nsjzJhGo9gWIOXvu6MF7/c5YKYZbU+9kJdBDztx3zo658d36IOQVUdzT
        +1uecWQ11E63pTYKogWurFKUpPslXQPQvyudgorFiz/UwicocXcDL2HJStdJ3HeS
        ZEK2NH397t2vYTKsBFZ7foeCgsDWPgrj0yHRWjWyzou9Zllh7kHXdrHtoh3adO67
        rvrjeb/rzYMERlQronFKwzIozl/35B3xMDTb5OonXQ+Z5L3CodM9O5j5rtQunIHn
        pzUCNcB576XdhaZbmH1/biahR0Z0ro9MHRhi5bi/EwfR5JZ2NlafcjYjA==
X-ME-Sender: <xms:aK-wZI8DLahUka2iHq8G81nwFOBnyy0lbHuYiiHxRKojmd8OHEgEVA>
    <xme:aK-wZAsaJ55nnmBdsIR07dg5gJfd4rR6ogw-5pYVoqrpWe6jQ7hBE023GMQHrYwOp
    ldV_vP6yROBwrULdYw>
X-ME-Received: <xmr:aK-wZOBQkPvdJL0FQF4C_oE_3lEYrR-X1EZayAcOxnP5_s6Vg4nhRO_1SzSYCYVN9ihvPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeehgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffuvfevkfgjfhfogggtsehttdertdertddvnecuhfhrohhmpefnuhhkvgcu
    lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    ekvedvudfgieekfeevjeekveehkeekgeevkedttdfgiefhvdetheethfdvfeelteenucff
    ohhmrghinhepghhithhlrggsrdgtohhmpdhlvgguqdhrghgsrdhmugdpkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    lhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:aK-wZIcbf9jNENuu0FphU4KydHAlfHDre5Col4oiHRd6YKJRYJo2xA>
    <xmx:aK-wZNPGkQ89-GLMwfcI3VgIfNeEcFzTpwhpvcfTrqI0B04lTgOrDg>
    <xmx:aK-wZCnWHV93Z6wb4f7C46kuEDYulfmKqafFfrziyOsq41CzQhbvjw>
    <xmx:aa-wZPWpggjtE-uy6C9p3Er9oR8-Dg32oUakpaiV4PjbuNcW7t3OHQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jul 2023 22:13:58 -0400 (EDT)
Date:   Fri, 14 Jul 2023 14:13:45 +1200
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH] platform/x86: asus-wmi: Allow setting RGB mode on some
 TUF  laptops
To:     Kristian Angelov <kristiana2000@abv.bg>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Message-Id: <XUKRXR.EXISLXOQZ4I53@ljones.dev>
In-Reply-To: <1170345346.1954736.1689271442530@nm83.abv.bg>
References: <221464915.1954715.1689271415914@nm83.abv.bg>
        <1170345346.1954736.1689271442530@nm83.abv.bg>
X-Mailer: geary/44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On Thu, Jul 13 2023 at 21:04:02 +03:00:00, Kristian Angelov 
<kristiana2000@abv.bg> wrote:
> This patch allows for the manual setting of cmd values 0xb3 and 0xb4.
> This is necessary on some TUF laptops in order to set the RGB mode.
> This should not break functionality that other machines might depend 
> on.

My own notes at 
https://gitlab.com/asus-linux/reverse-engineering/-/blob/master/TUF-i2c_laptops/led-rgb.md 
mention these commands, so I'm left wondering how I ended up with `cmd 
= !!cmd;` in the first place.

> 
> See bug report: 
> https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg/
> 
> 
> With this you can pass 179 and 180 to the /sys/class/leds interface.
> I think a better solution would be to somehow detect which devices 
> require
> these values on driver initialization and then just handle it like 
> before
> 1 saving to bios and 0 simply setting it.

I think we would be safe to use 0 and 1 for simplicity and map those to 
0xb3 and 0xb4. That might even have been what I intended in the first 
place. There is nothing in my dumps to indicate the 0 and 1 were inputs 
to the ACPI methods and it looks very much like a mistake made by me - 
the one TUF I managed to get hold of does indeed have `If ((Local0 == 
0xB3))` and `If ((Local0 == 0xB4))` in the ACPI methods.

Cheers,
Luke.

> 
> Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
> ---
>  drivers/platform/x86/asus-wmi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> 
> diff --git a/drivers/platform/x86/asus-wmi.c 
> b/drivers/platform/x86/asus-wmi.c
> index 1038dfdcdd32..8d3d283fb306 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -744,7 +744,12 @@ static ssize_t kbd_rgb_mode_store(struct device 
> *dev,
>  	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, 
> &speed) != 6)
>  		return -EINVAL;
> 
> -	cmd = !!cmd;
> +	/*
> +	 * Some TUF models need B3 for setting the color and B4 for saving 
> to BIOS.
> +	 * Keep old functionality for all other values
> +	 */
> +	if (cmd != 0xb3 || cmd != 0xb4)
> +		cmd = !!cmd;
> 
>  	/* These are the known usable modes across all TUF/ROG */
>  	if (mode >= 12 || mode == 9)
> --
> 2.40.0
> 


