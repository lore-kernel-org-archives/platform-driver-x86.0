Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795687738;
	b=uvx3T+Cr7IDHietOYsx/loOvqWR9mdsvA06/qsD4NibcT+kidWcr/Pc7/qXpmHhQNeqC
	 Bazs0dJhVz44IS57UPZTCRGsSHGXYHOa5yxavYEfERr2n7B+WhiRiifebmFVAhsl7t/dC
	 WuUwA02cmhEZ76CeunGgM7uVp8ed+1mSI0Sq7tS7/E8irzYP9loXec4wES2LvkdMiwXmP
	 F9FzfBVDPcLQQS3TSX2qEhHrin0BEuHjZUSxnZWP6gnFxMreDZRamFbyTDGcExqe2tjkJ
	 z5S2gUEhJeVFbnrKLrBhPIXDmnwvn2mWxA0SibO/pW1rOKn2/SPOy/Kdz2HlofQovZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
	b=vnUuEltKGFur3mI6gHM7H+/Zh77TX4fRwV67GUy6MX87xG5/7FFj2nBZSeV1hcT3t2XS
	 pin6AYswXZ09DRE3IRkPnaPRBNOzH5HEiFS8zkY1LY9xGm9nYWRCqg/OinE45Ra/H5+o4
	 7kVq+03iTjIoOsmR9bFxDpYlMuR8WPA57ZWSTBE4zZ7VmzKX0qL4bpZzzmI1rzIMJAXrF
	 fJWS7MH/ivqaSs7wrXuf+CDHqJngbh5JCvrXtm+rPlpRMhZomnPLURUrKvwYEifz2UJVA
	 abxx7fDAyVO9CJSLRmJWNvKV+cVIdmtaE7vWzjcSmU4lcn4chmAl2gVFWcqz5bzzBAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLnLq7sw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84355606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 10:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84355606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLnLq7sw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fd5so3947426a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 02:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795687737; cv=none;
        d=google.com; s=arc-20260327;
        b=Ao0YD8juOacUxRzFHf6EOugi3yyuk3sgVeDrSxkZXB/g32pvuUxteirQOJGk55yi3y
         Y5V5reGjW+FfcCKSWvEm5XFj1EVNqd4Kdecb8WZ0Mr4qlnTLtC3R5bVkrY5BfK/E5fUC
         TanuERZWdkG5L9szy9EnmJkGIDA6FaKDnTgw9UNTp8zRGmHpM7yQPjfQt2fyFfibN4QI
         BncFpTeQeZvXJ8rFKHDBkRua/7640u2FrgtNfhddtuJL4sysWFahxZptqfbfRqZXUn0F
         Vr1fMzYQm9TLo/kiRk3HyorrjuFexeE6tKEtFZ1QrYKs1dUChScEX8bZUw8A6y7sSUYz
         +c7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
        fh=LsTol1L1g9aJRMXrnHpBo9jg/KRrlxYaB1M4/SitdP4=;
        b=iUO45BiO1Y+Zbmkxw5HAIISesRGSJjOpsdxVHvHX7l26aBHdmQu8S+2e9LV0YMFZvT
         xlRHFqXhS+WbzqBKt8QD5HNEae91B5VqwmcsuJ+pEAbSb7YNyzpgXYPTd4XrX3Lral8e
         SuJaA/elu2ZU/BdfK2XQpJvSon9gHQFUpNA++TNglzHVzoMR3T05u6olB6TiUsM5fxLZ
         CQwD2mK1aVjW8qRA/UPDuYTx3JgsCvCwgrP77Har34pneGterbSpnKAXgxr+siSuBXqB
         eck0Ik2CEVQc8q+lCA23D9GM+8mwif9tvVuuJh6nkxafuKfVbY46GIcipCfzQbLeTeaI
         WK+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687737; x=1796292537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
        b=BLnLq7swDKkGqwuOkT88kDi/k5Wkx5oS93R+YopL4cpAdWoUggr1K/iXwHu9AMn7jW
         YdCVPUsJFlfBA/kA/tjTHmEFgNHxTvJsTOvLzcq2//cNf0QTiA/3BC9fiqw9OnGi+rXk
         ZwxF2DnIp0XOHmhNr1oRVzv8FMN2uwvjA7NNhW4osabSFGPHv46o/L57MH7b8bm2za+A
         m2XggcYchWL5IHY3hFg+HAUeKqQDThIEHXs2Z8C9i2O6sSJM0IZ38NEn6RLh9z8JEHZD
         VnL3TYvQFKyv3jpmH3mxanQdF/liqE7IP0ck90K68jb7cFne5MPTJyexbCgb/IUcT+A2
         X7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687737; x=1796292537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/vfwATZ+aTQb+3ShWrmO/WvkZL+j5UiTgHiGPHPM0A=;
        b=U5uoH3cVoB2hz7vLTinICr5S1ddU65W0ZYz7o7OJWKkT5QhQhux6StPsldmaVsCnRQ
         6pQsOHW1InxjI87FgYB38+A3DGbwIK/p4bp0abvfrpnCLDSyRbK600upqUrBcw1dQO5g
         AZ8dy/Uc9V9rIuEMcsVOriES37Pfz6sxdZNmkvcdBCsl0Jtw6k/v1kKFEpCVLQgXCPx+
         d2gUA1aTNWtgonPySqWjaK5v0UO/sWzMac2BFzrx2yNS+qjdZwSSg70x4kDUKF6PLOqD
         TUpbvs8mui8jd19yREd/LmCFBn4O6gDfq2DPckPufJ/oHEZ6dfJm7XZRUy1HW7hDNdio
         ikIg==
X-Forwarded-Encrypted: i=1; AL+hErFp6f6d72NVciIxoN+asTe8lik4CFAMPwSTCrAeHBGwohM2fSyvNLEztFzYHtNFfS5O7QQXUK5unlcG5d4lZ3VZ9awi@vger.kernel.org
X-Gm-Message-State: APuU4Z8qmzGw+R3MxMVQBx57quhBMoEHtl7jTjOTwYUzYczYb0QgmZri
	JAEYKuUqZHGMkZNjtZAKYBpaaogjBnJmVHDfJPziWd6P4ghi4kBnEDyJdTiBBgmVmInqB0jQooU
	RuoERNVzeakaKzBL2VWO/JRxdMEsrjBQ=
X-Gm-Gg: AZFdTZfBGzeiqsBUu3Czf3H37EWVBF+BNT3bnFNUQDMeIXBIk/LFlKs8CPgIbK8HONo
	qMlEJLJPNt+R3FzqGYWwDap6DM1FXLZ4+7tDlWa5NpjoBheocBVV5HTZHznijuPBNWytMF2KSQV
	KoaGDcVP0uVx9iEVExVZx1dBD5Htq7C6QnhDSUSNeIWF4ZC8BF69AJxKlw8PV4MpU3Un7m32CUY
	o9y1mdk3VdSRuOeMU+OBmHvQCXUVpeluiMVBYh8Djhg3Fe0b++WoG8TSadABtSQ7NLm5tMn4qSw
	pAMlqyBDpgpsVDmWeDllZCyMbRYFIKWS6+6zo6QmlThcvAIa7PD14ruCJwB1BUem15JM31W2T3+
	iwUNNOIhO596E3PXFYNhQoJoaK/gChObEEKSr2ST9kFQO4tQOEn93iT6wT7s5YdNbBrIxMsq0Yg
	==
X-Received: by 2002:a17:907:2d91:b0:c51:982e:28bf with SMTP id
 a640c23a62f3a-c51982e29d1mr584103766b.40.1795687736599; Thu, 26 Nov 2026
 02:08:56 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116155147.769630-1-erwanaliasr1@gmail.com>
In-Reply-To: <20261116155147.769630-1-erwanaliasr1@gmail.com>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Thu, 26 Nov 2026 11:08:43 +0100
X-Gm-Features: Aa3M54pPJggkTaxEZ8exgufSp3xG7DaTC8fi_wGV9VbwisqyDNi0qDOvXzZidkM
Message-ID: <CAL2JzuzBNTCAQBf-O=bJACLbVBXRM68VJ+KE7_W975X6tpTktg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] platform/x86/amd/hsmp: Unify per-socket sysfs metrics
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>, 
	Suma Hegde <suma.hegde@amd.com>, Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Erwan Velu <e.velu@criteo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi !
I'd love to have feedback on this v2 which tries to address the issues
reported on v1.
Erwan,

Le lun. 16 nov. 2026 =C3=A0 16:52, Erwan Velu <erwanaliasr1@gmail.com> a =
=C3=A9crit :
>
> From: Erwan Velu <e.velu@criteo.com>
>
> The goal of this series is to ease server monitoring, by exposing the
> HSMP metrics the same way whatever the driver, in a format that is
> straightforward to integrate in metrics exporters.
>
> The per-socket HSMP telemetry attributes (c0_residency_input,
> ddr_max_bw, pwr_current_active_freq_limit, ...) are only implemented by
> the ACPI driver, although they are plain HSMP messages the platform
> driver can send as well. Systems probed by the platform driver therefore
> only get metrics_bin.
>
> Their location also depends on the driver: AMDI0097:0X with the ACPI
> driver, amd_hsmp/socketN with the platform one. "modprobe amd_hsmp"
> picks the right driver, but userspace cannot know in advance which tree
> it has to read.
>
> This series moves the attributes to common code and adds an amd_hsmp
> class with one socketN device per socket, registered by both drivers.
> /sys/class/amd_hsmp/socketN/ is then the same path whichever driver
> probed. The existing ACPI and platform sysfs paths keep working.
>
> Patch 1 is a pure code move. Patch 2 adds the class and wires it in the
> ACPI driver, patch 3 does the same for the platform driver. Patch 4
> exposes the pwr_current_active_freq_limit_source bitmask as a single
> hexadecimal value, whose interpretation can be centralized in the
> monitoring stack (e.g. Grafana value mappings). Patch 5 documents
> /sys/class/amd_hsmp in Documentation/ABI/testing.
>
> This v2 reworks patches 2 and 3 following Carlos' review of v1, and is
> meant as a basis for discussion: I would rather know early whether this
> is heading in the right direction, in particular for the class approach
> and the AMDI0097:0X ABI question raised in the v1 thread, before
> polishing it further.
>
> Changes in v2:
> - Replace the separate /sys/devices/amd_hsmp tree, its root device and
>   its hand-rolled refcount by an amd_hsmp class, as suggested by Carlos.
>   The kref.h remark from Ilpo no longer applies, as there is no shared
>   object to refcount anymore.
> - Platform driver: the socket devices replace the bare socketN
>   attribute groups. As class devices land in an amd_hsmp glue directory
>   below their parent, a socketN symlink keeps the existing
>   /sys/devices/platform/amd_hsmp/socketN/metrics_bin path working.
> - New patch 5: Documentation/ABI/testing/sysfs-class-amd_hsmp.
>   Its content depends on the AMDI0097:0X ABI discussion with Carlos in
>   the v1 thread, and can be dropped or reworked accordingly.
> - Collected Acked-by from Carlos on patches 1 and 4.
> - Rebased on v7.4-rc3.
>
> Tested on a Zen4 (Family 19h, HSMP protocol 5) server with the platform
> driver, and on a dual socket Zen5 (Family 1Ah) server with the ACPI
> driver: attributes read through /sys/class/amd_hsmp, legacy paths
> still working, and 20 unload/reload cycles of the driver while reading
> the attributes in a loop.
>
> v1: https://lore.kernel.org/platform-driver-x86/20261007125908.321186-1-e=
rwanaliasr1@gmail.com/
>
> Erwan Velu (5):
>   platform/x86/amd/hsmp: Move per-socket sysfs attributes to common code
>   platform/x86/amd/hsmp: Add amd_hsmp class with per-socket devices
>   platform/x86/amd/hsmp: Expose socket attributes from the platform
>     driver
>   platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw
>   Documentation/ABI: Add sysfs-class-amd_hsmp
>
>  .../ABI/testing/sysfs-class-amd_hsmp          | 120 +++++
>  Documentation/arch/x86/amd_hsmp.rst           |  24 +-
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/amd/hsmp/Makefile        |   2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c          | 345 +-------------
>  drivers/platform/x86/amd/hsmp/hsmp.c          |  19 +
>  drivers/platform/x86/amd/hsmp/hsmp.h          |   8 +
>  drivers/platform/x86/amd/hsmp/plat.c          | 155 +++----
>  drivers/platform/x86/amd/hsmp/sysfs.c         | 435 ++++++++++++++++++
>  9 files changed, 681 insertions(+), 428 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-amd_hsmp
>  create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c
>
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> --
> 2.53.0
>
