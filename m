Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243B9B67E
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 19:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763319697; cv=none; b=EQ5/jNpVglW/JLkWxt9CQ3peYl5TkLFAPNWKQyEcO9sgtcr2XKY0aFgaVKL5uaulbyiM+O3ebl0EovZpakL5OYp5JCAG41R9c7g+Dq3NvnGp2BFIMkcfG4I2AAGVgZTnYfUBd8fDLC39Z+PmigZcS1CyxNN4fosQ0OeIsE8eD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763319697; c=relaxed/simple;
	bh=4slpiQnzzqT9VEPVGXAialPcvgRETzeWL2I8CaElE0g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JidiCMhCiPKweM2Gh058yTdaCfIGZiMSs/vO+tk/hm93H+5qrieAR0/yzhApibW8fLiqEhPYfHzXCn5MBDvIuVt8MGfk7do6uk7dfvVrf7FMNvoNVgRdiXWSNBeM9Y7xelvH03KEJcHIUcawiI8DnMHT9+bd90MnMKXUcZzXcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCvpLehQ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCvpLehQ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee1939e70bso6429111cf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 11:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763319695; x=1763924495; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24milp7i8k4/K3EyLlygGjCcfMNN8/7/O+z2rQ6DQEQ=;
        b=aCvpLehQ99hNZv6e5gqXzFjguFSzmKVBsX9gQsef8hqIiis9kAk/lmuK+8jg8+2qln
         2H+zjpqXK8lMr1Qwt6vozd2TIPVkReU7N+wyhXsfZWmFjdKxEwRHdypLjLJtuy7PGCpq
         a8sJMoW6QLwPlqXIIdGiMbjvVrNeBnaYZcvi78P4N2LiR4ryyYkuWGPa48ZDxYgctymd
         As78k1cW973EdbrdU/2CN4q7KKrpHqkOjX4kI3DORrsXp5NmW8ACOrt1p3+vs0SjTy9j
         yCXLdA41+DA9ztLB2iq+lywYSOfgRFDcarOB+6640/XksWHftI3b+kYHBlBTGrmgYcqR
         zhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763319695; x=1763924495;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24milp7i8k4/K3EyLlygGjCcfMNN8/7/O+z2rQ6DQEQ=;
        b=h7aOJC4QTQyiDLr/Ve66m3itRyjGDdiinq3Q6XMztAgdpVdGDNuMibSASWc8v2q1mU
         uiZS0xzXHsxqvNc/aTDsv6ngVaY6Lh8G3kwIj69MOPmkPZNSZtZsI1hz+xdFkSC9B9cQ
         LOP0aITVWtsXlGRdp1tHZmJ/R8OMmmI1UnL0vsWpBZmf8B6rjB98PpEu2QBIWtoNCdKm
         lBgcJfnVDS/U3t6Sk15FaZA+5pofNMJ7u7d8uqSqHnNbgl5wrrUKV4lxzazWcgOStD+R
         qDNkm3R2r31PxamvbK2vFJ/M+ITcViiSK0V5WF8/AYimwCh1lTyDlQb7xXqhGYOqZzQK
         +E8g==
X-Forwarded-Encrypted: i=1; AJvYcCUgk/Q2QKdEqaXsoobxZ/A7FMi5t4XbDTzYm4Mr6zZ3oio/ISiOLggZ1wiIOzUWqHRQLGaiLv5hdnbIvjtE9ci3NCX8@vger.kernel.org
X-Gm-Message-State: AOJu0YycMFQL6jeTwBTJEWfFE9i9OG16OWAyYonu0yRsO81/S+rBeeUn
	Ep3QHjwps/4N6Mlk2CTK9HSFfbNJjmpet4srB3L1R8+bD8nVrnYfgGNQ
X-Gm-Gg: ASbGncvTkiDxf2bK07OZncJvOI5TM0pCGUGn2QkGXN2HZdBqFduIk1o5cs2cQqbGZWS
	adVJuD4dLEO+FVnCt57OBgQRTQsWhlaVVwrRCeQCxXD80c6vEBiolTWvWXHRaMqYoUTb7VTHpox
	eOgnRvMkvoIYXZq2Us9gHFwFJx0I/oqKKmkyRPlygTuGKnO9TDvBIOfCKsWjt0QwBMsbaNYdroD
	DVFJgYCClA9IZhkF19VPrZGIU9iq+4L/GM4n97D/gpTE3Pqs7uFWLjWKZhLZTGX+h/lJH2gq2Id
	ODDXqss+/MuDM3FA3yUa7D4gWmhT2pabHX4ooGvxfU95VAIE4emBvFi4dhwOfM+fcB7qO3JLxd+
	6u2Bt453cMD6sR9a235fMk6OFn+FCFjaMdsgk0QwB7AO/hEF/P1nimOrQ4FwzDKaLAcbV
X-Google-Smtp-Source: AGHT+IFdCaoIqWIBiQ9UUsVG6zoIYmnPMfeUVKaoleqIDxyG2BEm7LbFSauIuGT/e6HDkAkhvvVl1A==
X-Received: by 2002:a05:622a:1456:b0:4ed:b134:38ea with SMTP id d75a77b69052e-4edf20f53d2mr141846621cf.41.1763319694782;
        Sun, 16 Nov 2025 11:01:34 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede86b3adesm69416611cf.1.2025.11.16.11.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 11:01:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 16 Nov 2025 14:01:32 -0500
Message-Id: <DEACNVZ5KBRP.38W42TRA1ILKU@gmail.com>
Cc: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
 <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v2] platform/x86: alienware-wmi-wmax: Add AWCC support
 to Alienware 16 Aurora
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Anthony Wong" <anthony.wong@canonical.com>,
 <platform-driver-x86@vger.kernel.org>, <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251116185311.18074-1-anthony.wong@canonical.com>
In-Reply-To: <20251116185311.18074-1-anthony.wong@canonical.com>

On Sun Nov 16, 2025 at 1:53 PM -05, Anthony Wong wrote:
> From: Anthony Wong <anthony.wong@ubuntu.com>
>
> Add AWCC support to Alienware 16 Aurora
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Anthony Wong <anthony.wong@ubuntu.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
> v2:
> * Drop "AC16250" from product name
> * use g_series_quirks for G-mode
> v1: https://lore.kernel.org/all/20251007084734.25347-1-anthony.wong@canon=
ical.com/
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index f417dcc9af35..a1ff63d8dc12 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -89,6 +89,14 @@ static struct awcc_quirks generic_quirks =3D {
>  static struct awcc_quirks empty_quirks;
> =20
>  static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
> +	{
> +		.ident =3D "Alienware 16 Aurora",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16 Aurora"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
>  	{
>  		.ident =3D "Alienware Area-51m",
>  		.matches =3D {


--=20
 ~ Kurt

