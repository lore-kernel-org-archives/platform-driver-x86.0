Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF615A85E
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Apr 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053172; cv=none; b=ctiuS+ibDDkUAIQgf3Sce/IJ5c2hFExHzLz9RMPBFRoX4JlB0wqm68vOlWf4gq6zJSCu0YbScT++phizFVvsNBdlnh3ShMdzrc4h6t4dQG2I/HA8cxkkxCx2YYybXKFP3igkr4UW2siypju+LdWX/eQPEWgJWdiJyEWabbA0WLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053172; c=relaxed/simple;
	bh=vtNBkvxfWXy3BO16p0VqqKfNnZBrVsoToeLjB2oVokg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYBr9PUE9Iee4aG9MwKw2oUT1tsd39vCYdJSuec2t/TV345K2VDP91MC17a9af/AZakZbIlnoIS2JXQY+rgr3cWqb5jzptYsBeHNeuO75mstUjAXtxwWHSQ7zJTxs+O8nz5EPkJRYvVxZqq02M7bmPWvBpClEZfcKm+goKy3j18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DlHgvO3t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DlHgvO3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745053169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4s6C3YA2vdk0xkc81ayMjzu+l7t6iT9CF85GPW20pxc=;
	b=DlHgvO3tKKJVCNfPnYzZlrKmF6eg6l/il2yHyaBvJWXoDQhhFoDt5sF/7sVCL8QwoRE2HH
	JWLP7rahk7QoPeqzkM6RuxzxgB1aQRftGHc9Dj9inwU8YPWR8mTcMDLOScuStWOVa48byl
	K7aJsgOPHaY+ALZfiken2T2awgZB2fU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-rMAl6aaoOxCFFUXQyEfXdw-1; Sat, 19 Apr 2025 04:59:27 -0400
X-MC-Unique: rMAl6aaoOxCFFUXQyEfXdw-1
X-Mimecast-MFC-AGG-ID: rMAl6aaoOxCFFUXQyEfXdw_1745053166
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac6b047c0dcso195473466b.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Apr 2025 01:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745053166; x=1745657966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4s6C3YA2vdk0xkc81ayMjzu+l7t6iT9CF85GPW20pxc=;
        b=a2pdr7N3i7GCHui4z6oDQ+2l2GC37qMP+q3pacbaaL147X0lms67f4VdaN1ppWpdQ1
         kg1XyChOFvQUISedXHh219caP78UrjztoX0Z/Qc/UOsfgnMqJm3nzrAACVL7+W6Da9Ei
         ViJcjNxkxondD1w+6K2FD8Tv7y1ZFFfBeayGo6eefxnJ4XsMn57HWyzjxU6mLu+58xvX
         0/oGkrUAdpQ9CDWqOWBvv2VIu8gWRNE59w4bUy0DXWAEEyKVML44Cvh4YFJsvvRgEjCY
         KcujCE8jTe9OzlcqMVuEaYkmoH0Pk+9kIuMJs0R/9zMeQ9eIbphJSB9YHmcrbuAJ08Sp
         MR2g==
X-Gm-Message-State: AOJu0YyX5l9vpHpbgl6spoUe8ALsWGxUCr19IhgJH2H2ZxbxeYjLf9J6
	IeKAftxHeRhPyy2LshggpaA67WCS1fVpY6u00V6UXYQQfkCP/fx6ar3t2qFrTMJr/p8otJEPIhD
	YMqKVf1Dd5xeACN7Yz/24rklHB2TrFMuclm3OAyy7LWSm9ysYWU2JSAk+30KO/AIPppvvbnc=
X-Gm-Gg: ASbGncvz/EZeK+0fMHfJ2Z8rN2mweSJb3dmwQBN/FWKmmb9hh1PoeRjBz8Ao4tMg+8h
	oAZqs/IF0Lf/Jk9gr3V1/GZehxhkH0wefqYr79aM2EnTpbElVAwnH2bSLqM6C4h/0GrPzvXUAKO
	OCoNPxBtSMKFRP5vP7kz7E5xikOpSLgtFmagSpD2WEPIAMTkRY+feUS5FCzq3ztexqwJp8yhXF4
	dZB20cdi1FpSiITjSoUBK9sOo931BGzrQ6kNjsMfF73CzCrEYQ/h4H46at6Bl2jz/UST6ud3zQb
	u/dCoWdnzdG8sVi/dC1Iv9aY9f3aL2uehonJjB+A+sIuW5kLJyunGkc/jbb5Rx9hiMIpaavJlxF
	zsqAh/vn/P4v6BGqavLlA6MORnqysAOL/SFC6SJREljR75s6dC3Leaa8qj3CSzA==
X-Received: by 2002:a17:907:9712:b0:ac7:738c:996f with SMTP id a640c23a62f3a-acb74b1a154mr447194466b.15.1745053166061;
        Sat, 19 Apr 2025 01:59:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG9qpcyq0lr5368qu8UaOu/8MsP9HRlxQVx2muUnK2TO9/tnLcc4AOVGauXbxVLPL/aIVF+A==
X-Received: by 2002:a17:907:9712:b0:ac7:738c:996f with SMTP id a640c23a62f3a-acb74b1a154mr447193766b.15.1745053165708;
        Sat, 19 Apr 2025 01:59:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc703sm236409166b.94.2025.04.19.01.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 01:59:24 -0700 (PDT)
Message-ID: <8c0d9751-767f-4e8e-bbf1-bbab89c1b8c9@redhat.com>
Date: Sat, 19 Apr 2025 10:59:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
To: Gregory Price <gourry@gourry.net>, Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
 <20241021111428.2676884-8-suma.hegde@amd.com>
 <aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gregory,

On 19-Apr-25 1:01 AM, Gregory Price wrote:
> On Mon, Oct 21, 2024 at 11:14:25AM +0000, Suma Hegde wrote:
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> ... snip ...
>> +#define DRIVER_NAME		"amd_hsmp"
> ... snip ...
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> +#define DRIVER_NAME		"amd_hsmp"
> 
> Hi,
> 
> From looking around this patch, the code seems to suggest that these
> drivers should not be mutually exclusive, but we are seeing an error
> when attempting to load them both - apparently because they both use the
> same driver name.
> 
> Was this intended, or should the DRIVER_NAME="hsmp_acpi" for acpi.c?

These drivers are mutually exclusive in the sense that only one of
them should actually bind to the hw.

Looking at the code this seems not to be guaranteed though ...

drivers/platform/x86/amd/hsmp/plat.c has:

static int __init hsmp_plt_init(void)
{
        int ret = -ENODEV;

        if (!legacy_hsmp_support()) {
                pr_info("HSMP is not supported on Family:%x model:%x\n",
                        boot_cpu_data.x86, boot_cpu_data.x86_model);
                return ret;
        }

	...

So loading that module should fail on AMD CPUs which fail the
legacy_hsmp_support() check. Which checks CPU family and model.

Since you are seeing the error you are reporting the system you
are testing on does pass that test.

Question, did you manually load hsmp_acpi, or did that auto-load?

Or a totally different way to ask the same thing, do you have
any AMDI0097:0? devices under /sys/bus/platform/devices ?

ATM it seems that the plat.c code assumes that on hw where
legacy_hsmp_support() returns true there will never be an
AMDI0097:0? device which I'm not sure is a safe assumption
to make.

IMHO besides the "if (!legacy_hsmp_support())" check,
hsmp_plt_init() should also do:

        if (acpi_dev_present("AMDI0097", NULL, -1))
                return -ENODEV;

leaving the HSMP handling up to the hsmp_acpi driver
when an AMDI0097:0? device is present.

Note that the identical driver-name is still an issue even
with this check, because if both checks pass a user could
still manually load hsmp_acpi and get the driver name conflict
error.

Another issue with the driver seems to be that hsmp_acpi_probe()
relies on hsmp_pdev->is_probed to only do some initialization
once, but that is_probed flag is not protected by a mutex,
so when async probing is used 2 hsmp_acpi_probe() calls can
race and make a mess of things.

Regards,

Hans




> ---
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index e981d45e1c12..871724995897 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -26,7 +26,7 @@
> 
>  #include "hsmp.h"
> 
> -#define DRIVER_NAME            "amd_hsmp"
> +#define DRIVER_NAME            "hsmp_acpi"
>  #define DRIVER_VERSION         "2.3"
>  #define ACPI_HSMP_DEVICE_HID   "AMDI0097"
> 

