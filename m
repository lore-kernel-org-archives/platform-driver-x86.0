Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413DA2DFA4B
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Apr 2025 23:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017292; cv=none; b=n/XUtE/vVBcK7n/O+x+ng/kdHYBFT6I5YoiH87/fpUHl5R5HE+HJawBlzLBvCnANx/UrJ2/llXHPF2D6GyMrwoXWlOrqzLqVBQ9ToL28cbKhz5o0EQ7duMCHWI9Oiw9gYTvStBjeQsa+lb8MFU18G2u9oP9jbpmWbSXoP9AoD7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017292; c=relaxed/simple;
	bh=XL6xJPn58t8yUYywbXXyBNZMUiOVbiRHwqaqTBEZjTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVqkL9QRjT7i376KVhFmgH5/vwiEIqzUvYmOJqj4f5sf74LC8Kkno3buCuXQtBiFSzr2t7Di3xl7lo1L09EU6VYPFcMntX1ytXGyegT1SMNrtzsc9YM8V+N6B5ZmYi6thdZxCT9v6KNx2PPJ7Y1+b+CQa0BjqdZcpsFoBQpjnhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bPH2hseI; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bPH2hseI"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0e135e953so233040185a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Apr 2025 16:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745017289; x=1745622089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=70stYPiDZjyjrgIPK0HEEb8LnUj2PhuamXNx1PTWbec=;
        b=bPH2hseIOY9i5qYMfTuitBDZRxlKuoVKiCkx1e6oO8NrSXRiFKesHRqCzt/t+Hdzb7
         cVW4cjQXiypgJfSR7+WZxRRSl+KpNKInQG5V5hyOm5HCJtoyvfquZp+yLzoFDjmVcaGQ
         jLawxHKU0LGCgcAgAuhI9uCuV5IUkV7H2IivoAP/HbrukULsTk9yBmOBKiyCbr4aRZq2
         GZNAWjmyOVURu1+kvGAogp2OuP/OsYVLTU/CP8QuADiccco6ptZzld/s2BjE4G6Rwjy0
         mg4Jg/Zyac/pkwH12AY3k1VQCG+/6m2qBPKMCjVra454B3mG9pcizIntfsKiT+jCkYQe
         xEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017289; x=1745622089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70stYPiDZjyjrgIPK0HEEb8LnUj2PhuamXNx1PTWbec=;
        b=OCvSO9kPnADVrxChV0TsuUqFEceKCcLxSWjOZX4wAS86JBCyEb2/xAVqngxhkC/OA0
         zVk05vx4Aid9YAFqIazobOzHiQuMVJVq3kEvB3kJWgK4xYZTQU2J7h2WD0zgtV1bTikX
         aeLvo/El/c67E99Si3t4H6DpVr+O8X7XAY7at4TG1X2MXuhUyyp2Iz3Y+T4NyJA1oEr/
         75mQORFiuMsjZsuGyJIHO9nnZDbuEHEet9VI8YOsNliwJYJaQ89+gIaK5yHFqticQjj7
         BGbcBon7A7g2pb2353BdvxihlT9ZYajRpo9opJDq0Kr9469yPNf2y/VfJ/ve6Xok3U2+
         Hr4w==
X-Gm-Message-State: AOJu0Yz81aCmOr5opCAUdZXsmWzw+ODzHkuG2ltrxb3f02h0/9R8tEwt
	ZyKs9iQFxQ27JDDUSbNVKqtwrtly6cRCxHBm3fxyeX1FGu/0IHgh1+hOR5vVGL8=
X-Gm-Gg: ASbGncvw42IThGemnizevXB4nH1x63vZjkEWyw7B2Ln8Y1462n9Al6ay+FBo3AaMUiY
	Hkp6K5wdYbh5vCswnx5VehwSH0hSUqA6BZx4M+v5JyGogzAiS31f88Ls7DpgdOE97BDU/0dXBlM
	pwHjtuKiSe18B61GKLO16izY3xUb5/Grx775xu0XDplMjGRS9AsfghZmQKPnN9QmMZUcQR7Gm8z
	5YYFE0kQXQj5ZvcGquVPkKrmYsJBA0WxUSdicPVL4ydPf1fatrHm43uQHorRoShnHFY1p8ordKB
	Jvju3nJo1Dd257WsxyLSjcHY2524AgYosQNbGMJO59QWv6yWUj+0DOspLi66XUp3zvHldI0N87s
	+it73ylKaZUbEiV/KkuAujDyEXLyCWaYjbw==
X-Google-Smtp-Source: AGHT+IGpxqqV2FeBRllNTQlAezKNGwOSqOOBcx03CxVFMEUussUOsabUMP+MJoy6jXBx/+ciuKJw8Q==
X-Received: by 2002:a05:620a:319e:b0:7c5:65fb:fe0e with SMTP id af79cd13be357-7c927f6327cmr762442385a.6.1745017288969;
        Fri, 18 Apr 2025 16:01:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e9b6sm154814685a.2.2025.04.18.16.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:01:28 -0700 (PDT)
Date: Fri, 18 Apr 2025 19:01:26 -0400
From: Gregory Price <gourry@gourry.net>
To: Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: [BUG?] platform/x86/amd/hsmp: Create separate ACPI, plat and common
 drivers
Message-ID: <aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
 <20241021111428.2676884-8-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021111428.2676884-8-suma.hegde@amd.com>

On Mon, Oct 21, 2024 at 11:14:25AM +0000, Suma Hegde wrote:
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
... snip ...
> +#define DRIVER_NAME		"amd_hsmp"
... snip ...
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> +#define DRIVER_NAME		"amd_hsmp"

Hi,

From looking around this patch, the code seems to suggest that these
drivers should not be mutually exclusive, but we are seeing an error
when attempting to load them both - apparently because they both use the
same driver name.

Was this intended, or should the DRIVER_NAME="hsmp_acpi" for acpi.c?

~Gregory

---

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index e981d45e1c12..871724995897 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -26,7 +26,7 @@

 #include "hsmp.h"

-#define DRIVER_NAME            "amd_hsmp"
+#define DRIVER_NAME            "hsmp_acpi"
 #define DRIVER_VERSION         "2.3"
 #define ACPI_HSMP_DEVICE_HID   "AMDI0097"

