Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A52EA173;
	Wed, 23 Sep 2026 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166722; cv=none; b=ZdpG/nuXqmdZ7vGCovQ0Ngb+m6D9AWWN9hD3/5wJ8hYn3u6aZv/YMC+ajOpUZhMlMdAxE8ivNc3Zw6alz6G1gUsBIQ1mQJ02oXudwkc7ABvt1di/wUsiWvNVI0+/mQfy/bAON1x6A66y5ydrYIVibAC9AXteneie4JBYOHdBFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166722; c=relaxed/simple;
	bh=OHDkLReqjSmF6dXmmu4Wss8zFv8e2wXa/6zdpLoQRss=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MrnH47lh/0G2V98+oTawYeaAO0eX2HmZ/U9DZsSV99W0tq1b2oc+u/Qe4hCl+JHKV0rr1hX2EaEFMbJZ9Z9JHwjCsC4VyyXH0hHtgIgVlWzC1wI7hTxC3mS+Hk5LcKYdf1iA5Y8nUG3xBBn0ogCWhW0lh5vjhJpC2uSTTEbRgLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=UK6FBHdU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ppHlYZ8V; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="UK6FBHdU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ppHlYZ8V"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 303371D0007F;
	Wed, 23 Sep 2026 08:31:59 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 23 Sep 2026 08:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790166719;
	 x=1790253119; bh=jDXUn17eWF2FJCQjh3KL/PSgYptSnJQP5HhHFDuMQzI=; b=
	UK6FBHdUz+hPlebxc7cU3stxTfSCA9j5dQsr/t5PaCO2fCh9wzMyrjuQN6E+btpw
	E8sHZGdkE82ay01yFDZmJpYX7knXtLNOC/VC2r+y8X0mGSOpVm7sFexqBBIawJBj
	xU5C7Wt179lLNavJ6ao70RRgw4Je8lCKhyTzRVN8NDMqBZXNTM5imk9dxyE2sdse
	oAbcZ9b7p/B+cOG8clwC3mgNVyyhSB7AH8kNxgN7E/dGjjFMP11ifnjtWgT6f450
	cihLa+UYYFNPqX+jOrKJVTm5wdvTEHG4LOz/qyuSCekcodG/K5ljzCTyUYZ57iof
	Hu2hl2+3EjqtIVjK2Fj7sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790166719; x=
	1790253119; bh=jDXUn17eWF2FJCQjh3KL/PSgYptSnJQP5HhHFDuMQzI=; b=p
	pHlYZ8VNFXbzvLm9EHLnbgUs43MvHbA0Y1P2dezWcKYJz5JtC+4xpKBXaydF+oE6
	gA04gxTXIChR7bXwCxZHxIVv5W1znu13CQbUEvGOQ6l0iGyAeHFmww8pOZM4W/2k
	1B6AasVA79zXeOZkKQGYw/WLrgsP7Mpj9wxIDuQ9HwV3OPH+K9KoCnHjstTwiRyM
	Rx3A6WhqunZvMXSm/QSBZc5R8wk1KO4SJsRkUYy4OggrgnVd3Wk9dGizJsTQX60l
	Qx/mNpkrCJiMyXpDlMQabld3r3Rrmkv8uhMuv2uLHGOjLHraNXvtSH1zrxh3NawM
	sEpH3j5ZTr7w135X5znHQ==
X-ME-Sender: <xms:vsazalKMYYint3KhR1dZurR-KwVQXuqcVisL5dVNz6Atpjv-DCtOxw>
    <xme:vsazar8-wQjd6PjO9NNcBXDQHEuPt2nHCV0xl93mA29sWPHrC3cYiY6osQTR-wmYR
    hjkFC22C6IhLJ61BUYp6ILQgI-pSujy6LprLAazc9xAY7XTg7IvZvI>
X-ME-Proxy-Cause: dmFkZTGVtdTIK/508IOgQoOWrA0Qx8WXTGemjRm6SbKY5aUPv57peLQzzE6A0/JoWyRXJB
    upy29g3ypnFw4U2Dl3JKoy74jkJZ3jSbYCSUpuvbO7RwhW9YbgHHiMLZbhzpEcc09JMfOm
    Uh2uN/pjqW+rIdmJxqVsWkEuFcgUGDwyqo3657F19TaWJR8D+qMesdtvJ3ytnDsqDYycr5
    3UgiYqh6vwmJOl5mB1IgoDWcXNArLObi5Yo8r5LC/YTvuZvp2ESZcz6E/BFfwyuGfaaKK3
    GiDORkhXOvMBRAngsoW1zZi14xnm+SEj/g5Xo3XwubVfBcwFX6Jxclvv3u+tifYlbJe9Dx
    l21o0T/iY3mk3arc2W9uGSXRhcVQAqdmHUj6DEilTQERANOce8nQzPUjNSXtM2UeKDFwVn
    VFDn0hpZNvxVHFT08RVDPfBuQyDKxsr78sGtaDl8T3SsSPKl94dvn8J53imkCnRbKr2iOy
    LDWMJTRu8OqO20YzLeOLVN/Vjm3j26vY8Ls/cP9YnTl608SJlDOuZ8r8rzbe/e9Z3u6bdq
    6lXbf2s6Q29Qsji4AxhFs8567vZt4WUocOoM6rn6qieQDELN7AyIH9NUd5xGta3fWNFs+H
    vcVw+9id4b24zypWODwmnMoRAz6D98qJj740GyAozTLJsOJWdpRZVH/oVDzw
X-ME-Proxy: <xmx:vsazamEdaLdjVVPORBTTTSzLgOpHtu0j8l6oZkmE0XLOc0w0RMp_ng>
    <xmx:vsazasRdsuKj4zLl22RDSUbUTqhnPtgiS3R9VrlNja3gOlARu2nwbg>
    <xmx:vsazakY0YLAUcMtEtMMh1SRT2iFkMV0D34HK-KvigaBr-DLjEeKBfw>
    <xmx:vsazav3bFn4l2OJNa-nIaxlFqIChN-3wV1IqRNZ3AHk1yOgfL6Hg_w>
    <xmx:v8azarvWepPlrvhGX33fQINyGa2rIqf6sBsE-ha5CqYtWm7oyNAddZAi>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 5A6F52C0006A; Wed, 23 Sep 2026 08:31:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgyGGOYLiW2o
Date: Wed, 23 Sep 2026 08:31:37 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Randy Dunlap" <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Message-Id: <251504c6-c53e-4105-9d0c-30a6e7054007@app.fastmail.com>
In-Reply-To: <20260923024957.845198-1-rdunlap@infradead.org>
References: <20260923024957.845198-1-rdunlap@infradead.org>
Subject: Re: [PATCH] docs: ABI: sysfs-class-firmware-attributes: use literal blocks for
 console commands
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Sep 22, 2026, at 10:49 PM, Randy Dunlap wrote:
> Use a literal block for console I/O so that the lines aren't merged
> together in the produced output.
>
> Also correct some punctuation.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-class-firmware-attributes |   21 ++++=
+-----
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> ---=20
> linux-next-20260921.orig/Documentation/ABI/testing/sysfs-class-firmwar=
e-attributes
> +++=20
> linux-next-20260921/Documentation/ABI/testing/sysfs-class-firmware-att=
ributes
> @@ -397,22 +397,25 @@ Description:
>  		unlimited attributes.
>=20
>  		Read the attribute to check what save mode is enabled (single or bu=
lk).
> -		E.g:
> -		# cat /sys/class/firmware-attributes/thinklmi/attributes/save_setti=
ngs
> -		single
> +		E.g::
> +
> +		  # cat /sys/class/firmware-attributes/thinklmi/attributes/save_set=
tings
> +		  single
>=20
>  		Write the attribute with 'bulk' to enable bulk save mode.
> -		Write the attribute with 'single' to enable saving, after every=20
> attribute set.
> +		Write the attribute with 'single' to enable saving after every=20
> attribute set.
>  		The default setting is single mode.
> -		E.g:
> -		# echo bulk >=20
> /sys/class/firmware-attributes/thinklmi/attributes/save_settings
> +		E.g::
> +
> +		  # echo bulk >=20
> /sys/class/firmware-attributes/thinklmi/attributes/save_settings
>=20
>  		When in bulk mode write 'save' to trigger a save of all currently=20
> modified attributes.
> -		Note, once a save has been triggered, in bulk mode, attributes can=20
> no longer be set and
> +		Note, once a save has been triggered in bulk mode, attributes can n=
o=20
> longer be set and
>  		will return a permissions error. This is to prevent users hitting=20
> the 48+ save limitation
>  		(which requires entering the BIOS to clear the error condition)
> -		E.g:
> -		# echo save >=20
> /sys/class/firmware-attributes/thinklmi/attributes/save_settings
> +		E.g::
> +
> +		  # echo save >=20
> /sys/class/firmware-attributes/thinklmi/attributes/save_settings
>=20
>  What:		/sys/class/firmware-attributes/*/attributes/debug_cmd
>  Date:		July 2021

Looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
