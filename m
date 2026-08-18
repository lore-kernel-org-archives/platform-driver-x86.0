Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1235E353A70
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096198; cv=none; b=iFqgQusu9bgvJN47hX2a/8/g+3v3C6kTorn7RJmEphvvOueiDEaJ25me0/FuIKPEQkwVNmiQN01a2sk0EePXk4XDD9biLDimIMrwN3EhDPEbIFp/oHh5AIOUyIMCvhEFwbBBmxLu5YkEaImNowjzaKjNmpOXfHyAEiAeUzLDMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096198; c=relaxed/simple;
	bh=04/k0HG1eRbygsQ7nkV1skRD84HVvidkF82cWdZsu4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBlRlpWbPgRpi+RSJzy/idj5Nh28u1AWxDJgTqZCrrF/IW5MiEeXI2cE0Y/yThSFm9ZSE7pDtZYyRFeY+qnxYJ6c2OglwPSZGADp45+YreQotObY05gZAg9c+KT8M8TnBhEKqH6AFaeaypY+qPR5Olr4ed3IIyHUI1kIDEWcllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLvtGhuB; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLvtGhuB"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedf318752so239784a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 16:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096196; x=1787700996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EGd/77iz2abHF5y4GuEtLKn0yrAYtLez+CqQGXBQpE=;
        b=JLvtGhuBRA8o08zhZ33nqqkHKpVSRHxwOyA+30Hj8MiWwnyI6DI7jKKNw2uv9XGuJ+
         L5nDjYkyg2SC6Z5f0tLsvLxiMv7rpP6KJKDjKP/KNgmBxL/hEhLq2xp2q4SwOeSedjLf
         /TtujYxbWNebHkP4M43Hj3yXgVxoS/wjbgP1/fhLA4pIH4rg3rNE3sLDULptdz3sN9kt
         Uelfo7lWhbufai/YStfqHWpkvM1RXP9tlOrEI2TS0JwbgTpXfg2HTbxHxnPL87YUuo1G
         4WG1L02oiPh0NXrbnbGi/rkZUVykKxb8hMyIBtVf2QBaxBIloCxOqvirG3uuo97r918q
         p9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096196; x=1787700996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EGd/77iz2abHF5y4GuEtLKn0yrAYtLez+CqQGXBQpE=;
        b=SXNKx4pendU3XST2xJcT80/7MaOpxJA0inCBhGmkdhSO2nkBVagrxRRfEFptpCjeUK
         5faRognaAQtKJiYDikiP8RJRq6lCYj/ej3rk505yFwgyok3X1NRAE4QtzJJWfJWb4wUD
         m57WZrySPG6aEv30pQbDRteIfcWA08HytA/STtUx0GTzVN6LN8YslflOZ/FNyo8w9sYY
         DJTW+0Tsg4cLjgQzNbvcBjUbN3TTxoB+fgJbHcbbWxGfZ9pbXdkYUHWDKxDw+4frrywN
         wM3nep2sJaNd9MVAFrM+OmPIDdoCmtMRshaVbnWrJjKQByfw5D79SfcMJPC5NJ92UBoX
         12vw==
X-Forwarded-Encrypted: i=1; AHgh+RoRmgQLu9RckRRjdy9H+29J0G1uw1RLW4D/wm/51isl6ONMvZhnjbZxtna7fvh4GNYPvAchPdEFseuehCQW6RVtnicF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxubk7QUoyiRgdS48eskv4bo3XO/9egLS6mFYjVFBYrHLQqBVD8
	bykdHe4ck/hEDhZTHoVGlKGhedIbJlySTJREfInAjeOBhkB+cPC7I/BV
X-Gm-Gg: AR+sD1394qxNdjjhf2FiQiGpPt8Fy2/SGBirh0nQ1ar95s3I+67Y8+8t8T3pHuJxXgH
	em/02CYIcLREef2TPLQze5YFrMB6GmSnQfa0nWq+eOKkHgWBG1UYihN5SWbKXxrwGVkKyVfkwGt
	tmelDCN3kNrvGIQDmJR08KQfpdY1DQStWLMpjh4abZjRZGtfHv35RSMWDJ1NGAX+AThK0bs06i2
	p+4PnniIHRJB+IqDTuaf3CBKoyQLLHrwwRKv7+ThggogU+dkPRPUx+tVOEtVWEMBo+reymcQCgV
	PumS57GgHGfG+2wcFtli5KOFwzygIfY9vbC90DZ5wUhq6X+Po3ghPD8d67l9iVfSpY3/Pge8ffq
	vtzb491fVTOR7ZaXXzBe4a/78OGONcXWOOUpNVAYBsA5AwlyomiDBXptzpZ2oasHpdZ6uHDQKec
	piAgA/Srqu+lR+nQDaaVfDxgvLgxQvwSVe4Ailv+1Fj548NUbZWjv+6sGw99AzBYEmZeKJX1vxr
	w==
X-Received: by 2002:a17:90b:5484:b0:380:f389:447b with SMTP id 98e67ed59e1d1-395810840ccmr900386a91.11.1787096196075;
        Tue, 18 Aug 2026 16:36:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10a94dsm558957eec.15.2026.08.18.16.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:36:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:36:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nikita Dubrovskih <testname142@gmail.com>
Cc: linux-hwmon@vger.kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: Add fan monitoring support for HONOR FMI-XX
Message-ID: <facb9524-b665-459f-b522-ded46d5bb57c@roeck-us.net>
References: <20260812192242.859307-1-testname142@gmail.com>
 <20260813091411.1186193-1-testname142@gmail.com>
 <20260815232405.2107574-1-testname142@gmail.com>
 <20260815234041.2262291-1-testname142@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815234041.2262291-1-testname142@gmail.com>

On Sun, Aug 16, 2026 at 02:40:41AM +0300, Nikita Dubrovskih wrote:
> The HONOR FMI-XX firmware exposes a serialized \\GFNS ACPI method.
> It returns a status byte and a 16-bit fan speed in RPM for either of two
> firmware channels.
> 
> Add a DMI-restricted, read-only hwmon driver using that firmware
> interface. The driver deliberately exposes no fan control or direct
> Embedded Controller access.
> 
> The interface was validated on firmware 1.09 with fan channel 0
> reporting approximately 2500-2800 RPM. Channel 1 is readable and
> remained at 0 RPM during idle and a short CPU load.
> 
> Signed-off-by: Nikita Dubrovskih <testname142@gmail.com>

Queued for 7.4.

Thanks,
Guenter
