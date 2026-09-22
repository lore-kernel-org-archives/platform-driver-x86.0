Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979414CDA0E
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058367; cv=pass; b=pFkrhAWRo4yIwL7vMS/bvio2WH5Y8psBcnf2Es5sL9htkqCcRZQSqVhwS+p3m2Ot6GOO5eytu0M8G+6aMZ/s2CKJ9U5MYDf7jYLQerX5YE7ISAWGyAwV840KN9sM0PH4nMGabgOpd9xsbGykn/1xMGMzX5qG3uRUtQco5FqEAs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058367; c=relaxed/simple;
	bh=NWlgqNLKweH3ATk1geLVbMIqFIA0/0ejdghv0i1bg1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgMOaOKpFZvwd9CsZUgC3HAbHqiXDNd7yEKymZrpkHOIshOT1OglhUWDlJgkhuT+0tYtJRMfbLY41LvL+J0MmJA5LQrEOSkrC1meU1fuDL4xftLA9gKIRNzVXiRc2D3jnE+5bQ98ZwEmgLR0W5dD+LkG0YX7XA8Ndgs/NZf3m0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOzihiQj; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOzihiQj"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac6089so27247147b3.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 23:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790058357; cv=none;
        d=google.com; s=arc-20260327;
        b=ae4WiBd4Za+BQEzBa9ECCNl4KwIBsyLP9lWztP7+CGc3fzC97TYc7forDAO2olhUyn
         ykDXy4S6uwTi50IkaiIZPAGkUi29igWYSqLPHT5bsCWfwVuWMjHgx0ckNJK4wYNF2kqU
         b+1H82zhNAktXcKTtjLnf9C5X0n5GhpcdndC8QNsZAdO2uSh1Zgdv1mmRE0xo1ww3uVO
         jXNH7cnRItZ1ZZrG/ACTUQVZcXfJZ3Jb7QvAdW9DlFlZEtk8kLppoK4xxgrpGAlfkGFZ
         ZWRDgXrHeKVaRddU+SDc49GbeOmu7biwnV8Qy/wR9b1SGllXDvWyb3pKvGtLRJUlB3Tz
         ENzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E+nJqAVEVSsrZdHd6yhOuTvFgC2p55IdzmRHZTpxGUs=;
        fh=j7vVZNkrpqlD9p+G7mwDvVP6m//0Oz1UPAyamWIsQ0M=;
        b=k6wr19+p9XABrwS+9qXnWWPEvleKpkYzc0Kjg4RODZRek9BciOqbZUZ7JYNVJR3ZmA
         A3ZMBnPfOVBvjnvo/i90+NUdl4hq/7ZAgSvig0KQ/QvjYD15enpmOGIDOQddLcKYhUHV
         TYNZTtkI8gMNmaX1qXF0FwoE8C8IVk3uNKeqLSchoK+32mF7N7raO7MeTk4a2U644BiY
         K8zRvZBzcMO938rRGyC40kWshGe8nG46ykEMVSFjy6fR60GfGZU1VESU6xh8A81p9KP0
         w66PIxTKyKR+vV4r3mA7J74EMWQAig/KbCefdv1nfRz2yTh9k8egaIZinXcviMqRLww3
         pPyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058357; x=1790663157; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+nJqAVEVSsrZdHd6yhOuTvFgC2p55IdzmRHZTpxGUs=;
        b=DOzihiQjXLcJm6qn4b+5VvGgcptfWoDu7cL3i6R9uTLueh0OVXRSlxOj7KtD4f1J4d
         1MzKAIY2zpavA+hc0nLxtp50gX6zdzyuvDMCuaPUl94rD5HzYAW6320pdNmYGfasP+M9
         tNhDiOTlteUvOAVlVy1CDTXPox6q/z1YYpAMIy2qiKU/URtS4WGHakzITp/ExFxVy3eC
         qCPyu4EDQLJo9m9eh/cejwGZ8vwXOtt+5RrdoITQFrOqVQ5AfA4sngw6y1viLhBcKI4M
         /JVoSPoIGW+AexoRPFu/+BCxayYkRkpKXZH/FvCiRMKmlOTQzvqB2dpSKygjWt3jtGEj
         lI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058357; x=1790663157;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E+nJqAVEVSsrZdHd6yhOuTvFgC2p55IdzmRHZTpxGUs=;
        b=sYLjnuLMrE8D0nlyIwij5r3hWhjS3egVbAkubvt/XH3mb3FciJ1QQvC4JKv1lHMZV+
         QPDjqakyE/FFbd/Kqc14/LEF59ti2qc0gkwgeCc+JiZXaFAuay7Wm7z2DuirHxJcfd4i
         XLDNrinvUdIKBLYlJNdwSfh08Crh4FiPlA3gR7y0PnfIUhhgLEmt7udMdmFbpHJGry9h
         2RtCv3Rhp8FhZOCMU5AjoKAnSTjzB7fMYkjqTam55XZd8RTD4We16QeGnYPU7zbJ31HO
         3ErbBMaKgr1zSaPT0OF5z2MABunjOWiqEtr3Krromkn8tI7Eeht8mbQ3Tl4ko6Qnmw7G
         XAoA==
X-Forwarded-Encrypted: i=1; AKwUvBw6UsavIKJiGch7CsE4hR/pHQvCD1N+Osjx2+5rYQc/iJEJmOY1vmiwS5HSapsSr61jhbb3daRRkwlovtEkY6QCwY0l@vger.kernel.org
X-Gm-Message-State: AFuF++lp3GhD5Ia/czqTzK8MjHjp1y9/w78ORiln1bF/+lOiVTP6RO6T
	UfbKYS3gMr/0BjzbCA2jWlF8wnRuxuuoBbciIQ3S7aNkNhMcYvts1RdoQDrZAS2VIiYluHgQgNg
	ecL+kHLRCO2WPjFOozxItUoqkHn4ba0Y=
X-Gm-Gg: AYBFou0Tu6pEGku1thix/mG0cF5GNKfbh2UapqWG/RJZtYpB3wE8Wr7i7qC1YjJY/76
	t6L4yhwYJUfY/Z/pmWw9/9+f1DHYFQ6Ae1gXQA3DB79YAkjC1we+MEpGAwfItXeZlOqlHwZuOpQ
	V5Q6ICbuCwla+DsTFwowSCzwPa+ayfq3SFjnye22sy/jaK+i+pJRMf8sIj14s+cyTXqJP0fRH5y
	hRvjKo9/5qhEpK0DYIk9zoQngPoDJxEDUdkWQWvymvcr0RSJHxDMmY2K7NDax3q13wHrzUfSHXV
	4ece4TafQY16pYNzpqG3EYWqU+RpaebAvmDL5f14PyaIysPGYfNkdNWF+nsmYMeM8iU1Hw==
X-Received: by 2002:a05:690e:43c5:b0:671:471b:b94e with SMTP id
 956f58d0204a3-6717fccee36mr3255064d50.39.1790058357330; Mon, 21 Sep 2026
 23:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921082609.244774-1-lgs201920130244@gmail.com>
 <arFKFmkpldopUIMI@quoll> <89bd2593-e0ef-4b9b-8c9b-833aff327a3e@kernel.org>
 <CANUHTR91qqHtCbaFHSqcMa8eZuD7EnTqyFSfDMwX=LsiMiHoEA@mail.gmail.com> <20260922030548.GDarHwjL6ocubz8Lzp@fat_crate.local>
In-Reply-To: <20260922030548.GDarHwjL6ocubz8Lzp@fat_crate.local>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 14:25:43 +0800
X-Gm-Features: AcwNN1ViMdpAb4FKUbrVTSa-026gbS39xDlV0FFXJxS0Xg4qeiM5sdxARfwH7qw
Message-ID: <CANUHTR8qLrArRSgBrtzbeqnqiOsXNUXsXQ4Lxsta8HOUoxGsqA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/amd/hfi: fix platform device leak on init failure
To: Borislav Petkov <bp@alien8.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Perry Yuan <perry.yuan@amd.com>, linux-kernel@vger.kernel.org, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	stable@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

On Tue, 22 Sept 2026 at 11:06, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Sep 22, 2026 at 10:11:36AM +0800, Guangshuo Li wrote:
> > We apologize for the pressure this caused to the community. We will be
> > more careful about organizing patches by subsystem, preparing proper
> > patchsets, and following the kernel contribution guidelines before
> > sending future work.
>
> If you're wondering how to really help the community, try to review and test
> some patches you see on the ML. Whatever you choose - there's no shortage of
> patches. You can even let your AI run on them and see what it catches.
>
> This would be a lot more helpful than only dumping patches on people and
> waiting for review.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

Thanks for the suggestion.

Best regards,
Guangshuo
