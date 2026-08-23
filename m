Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE92F9DA1;
	Sun, 23 Aug 2026 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787492978; cv=none; b=cZZLdTtRGpqTLo1cbqp7989Ppxozo9asOOixpwisMy36Jx7PiuVxs13db2ZZIRsm6VUkA5BEiowgm7Ykt9jIeuZolTdI7sKq4Yyt8vbovMTgEiMLj9nCgC990ri3PTDHFRCsGKrLJQi0UhQWzJ70PbKUwRMHGsJ8HLsGn82mxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787492978; c=relaxed/simple;
	bh=uG4rudy1WSLvjlC8Tgv4+XKBdCMcT10CGkkUCXsvAEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZQ4ijf6WrS6gDrBt6FX3aOZ1LbxffRsfyAA7Ux3WBf0R3IFILSQ956PYUofvJ8WvkSliY5EXiuecdhpbAXReXaPWSUWjkH4vgee+go0yD7Z/GHa0ScRDUgqOG3ZD+O+yshPVlNKY8Xffe3jE4YnwBUo6TOIdoOs+mH4LLrFTeOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UE1mGJrW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UE1mGJrW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7853D408E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787492969; bh=51pJ6AfQeXWyFpC+sNEzvLm3xocUo5oRI/j2mxkaM1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UE1mGJrWA4/CV3XYpNwK86HdrNBujew6yOl8Y8yITr+hqL35EFPHnoQqadoTwDyww
	 KDFMs7e/G3KuCZsSUJdg9ZwvTJmjsmlVE03mrOY0TNAbANQWydBDDo7qjcYKW+CXW/
	 f1q/sexEa3WLsu0ju9tZRJFhy48zAI+COt+a9wF4DtFtqic56qDuBSMIQpnZUNm4z0
	 c7qVD9LTttJsnK7qbFrylWGdYCSgYfp1Bqw0Y/0bdhYKkFlJv927Z9yK7l53y98Uhu
	 SnpxZso93e68KkbasRGKoelFOGPNPrYjx/SRXaB2wywryIDn/WPxneYstYbUGqSrE7
	 mnFcOXJpnwZjA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7853D408E5;
	Sun, 23 Aug 2026 13:49:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yongho Park <yhpark7i@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J . Clark"
 <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Yongho Park <yhpark7i@gmail.com>
Subject: Re: [PATCH] docs: wmi: fix spelling of "frequency"
In-Reply-To: <20260823033006.45651-1-yhpark7i@gmail.com>
References: <20260823033006.45651-1-yhpark7i@gmail.com>
Date: Sun, 23 Aug 2026 07:49:28 -0600
Message-ID: <877blh2bh3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yongho Park <yhpark7i@gmail.com> writes:

> Fix a typo in the Lenovo GameZone WMI documentation.
>
> Signed-off-by: Yongho Park <yhpark7i@gmail.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> index 1769ad3d57b9..3579aa32c5d6 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> @@ -152,7 +152,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
>      [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
>      [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
> -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
> +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 OCOffsetFreq;
>      [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;

This is literal program output; are you sure that the typo was
introduced in the document and is not present in the actual output?

Thanks,

jon
