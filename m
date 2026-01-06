Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E568342537;
	Tue,  6 Jan 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712539; cv=none; b=gVIZ8+4QuFmSDgPqqrkNobaBGySvHBbDgsVpeybiqwWqRl7Kn0zcNQDOID/JSVONNoU/IKtf3EqHWqcjfiPFrg5D4aBSvXRmcsFa52Itf9PZ29wSUwV8AmD2Xh1YaE6YmPrEggi146oMbH5oYRJeXesssEXAddMmkKESIrZx6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712539; c=relaxed/simple;
	bh=QsmnXISVYa2pk6hjsYW8EskcSQ9P2G5mLsBWqXfFZHA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mIsHfAFhv83o0Pi+wBg/Sn3Xn3I6bFQQNVDRE+eQb+8SuM7wfPU4xIIS3jcFruMro0QlC9RFV36filhVahiIavF+zoT4n1GAlgkBL+k3g42td82K01drk2DAdMaEAeP44u3TCEGcDFfFOiI2eXlIubfpUkn2oV4VEM8iNYKx0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=h5QbmVgf; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="h5QbmVgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767712527; x=1768317327; i=w_armin@gmx.de;
	bh=LL48ECBy5NQ8UjaiusNaSiwKQn6MdugiiEWZv2gDUYg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h5QbmVgfXN9NR3yDcdp7joPqZtjCxxOayNa73EP1SzYHVPjtEmXWPh8ISFNVvsPG
	 AXqAIPziA5anGEtKSW+JVa8Zs1WmoZBUuYQQQ3ZZlSceckTWKUwo1MAINVRoPSoMj
	 oooStWxhubpUTTc9WuRUI9QIaT462sAiCISs6+hoqyndTbrurxYf+Qy0YmXN9I0AT
	 mX96As6BGmud3NytUisBZ+6u4Den1f5WdOROnd1zexZgxmUW6cWt2FvrHWIwvGme5
	 LWeczZGKjD/D4trd5BmnfoNbSo8NRXOMQg2QYJWbUxW90ObZAG5XXTQVeDUEzHuq1
	 Ks+i6zfESzvJSicNsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.90.225] ([141.76.8.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1wFTkR3RUT-00ph3f; Tue, 06
 Jan 2026 16:15:27 +0100
Message-ID: <24598820-dcd8-4e29-9c1b-58b5fdba144d@gmx.de>
Date: Tue, 6 Jan 2026 16:15:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] platform/wmi: Introduce marshalling support
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net,
 linux-doc@vger.kernel.org
References: <20251220204622.3541-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20251220204622.3541-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:T/axQS+SmPQo6fxHtf4RVCfeG8X9oP33C/DS+SRgfhuxmeiiBK1
 aMDokLnRZ5bAXOh6H2XV8muOT0LEoQA6EHqn26w3xVyTk1bBWQhBlmX9wnRxv1KVq/H18sg
 bNqq5ByGxplSrRo61nDXaBJxbEROCFLAYi/GxHPQUiG8m/yB9BkM+LcRSc1BkmpaARJpGJN
 nNdpLoCexC9dSyBmH4qSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MP0/g9BWQZc=;SnwndNaKFc9+ZLtCiw6gNvzC5Fs
 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

Am 20.12.25 um 21:46 schrieb Armin Wolf:

> The Windows WMI-ACPI driver likely uses wmilib [1] to interact with
> the WMI service in userspace. Said library uses plain byte buffers
> for exchanging data, so the WMI-ACPI driver has to convert between
> those byte buffers and ACPI objects returned by the ACPI firmware.
>
> The format of the byte buffer is publicly documented [2], and after
> some reverse eingineering of the WMI-ACPI driver using a set of custom
> ACPI tables, the following conversion rules have been discovered:
>
> - ACPI integers are always converted into a uint32
> - ACPI strings are converted into special WMI strings
> - ACPI buffers are copied as-is
> - ACPI packages are unpacked
>
> Extending the ACPI-WMI to perform this kind of marshalling for WMI
> data blocks, methods and events would give us a number of benefits:
>
> - WMI drivers are not restricted to a fixed set of supported ACPI data
>    types anymore, see dell-wmi-aio (integer vs buffer) and
>    hp-wmi-sensors (string vs buffer)
>
> - correct marshalling of WMI strings when data blocks are marked
>    as requiring ACPI strings instead of ACPI buffers
>
> - development of WMI drivers without having to understand ACPI
>
> This eventually should result in better compatibility with some
> ACPI firmware implementations and in simpler WMI drivers.
>
> The first patch extends the WMI driver core to perform said
> marshalling as well as a new API not based on ACPI objects. The next
> patch adds a KUnit test for testing the marshalling code. The
> following two patches then add a set of helper functions for dealing
> with WMI string data together with another KUnit test.
>
> The remaining patches then convert some simple WMI drivers to use the
> new WMI API and update the driver development guide so that new WMI
> drivers stop using the ACPI-based API.
>
> The series has been tested on multiple machines, with the xiaomi-wmi
> and intel-wmi-sbl-fw-update being tested using a set of custom ACPI
> tables loaded over configFS.
>
> [1] https://learn.microsoft.com/de-de/windows-hardware/drivers/ddi/wmilib/

Any thoughts on this? I can split the last five patches into a separate patch series
when necessary.

Thanks,
Armin Wolf

> Changes since v1:
> - fix spelling issues inside the documentation
> - add Reviewed-by tag for the documentation
>
> Armin Wolf (9):
>    platform/wmi: Introduce marshalling support
>    platform/wmi: Add kunit test for the marshalling code
>    platform/wmi: Add helper functions for WMI string conversions
>    platform/wmi: Add kunit test for the string conversion code
>    platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
>    platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
>    platform/x86: xiaomi-wmi: Use new buffer-based WMI API
>    platform/x86: wmi-bmof: Use new buffer-based WMI API
>    platform/wmi: Update driver development guide
>
>   Documentation/driver-api/wmi.rst              |   3 +
>   Documentation/wmi/acpi-interface.rst          |  68 +++
>   .../wmi/driver-development-guide.rst          |  76 ++-
>   drivers/platform/wmi/Kconfig                  |   3 +
>   drivers/platform/wmi/Makefile                 |   5 +-
>   drivers/platform/wmi/core.c                   | 160 ++++++-
>   drivers/platform/wmi/internal.h               |  14 +
>   drivers/platform/wmi/marshalling.c            | 233 +++++++++
>   drivers/platform/wmi/string.c                 |  92 ++++
>   drivers/platform/wmi/tests/Kconfig            |  27 ++
>   drivers/platform/wmi/tests/Makefile           |  11 +
>   .../platform/wmi/tests/marshalling_kunit.c    | 448 ++++++++++++++++++
>   drivers/platform/wmi/tests/string_kunit.c     | 277 +++++++++++
>   .../platform/x86/intel/wmi/sbl-fw-update.c    |  43 +-
>   drivers/platform/x86/intel/wmi/thunderbolt.c  |  26 +-
>   drivers/platform/x86/wmi-bmof.c               |  34 +-
>   drivers/platform/x86/xiaomi-wmi.c             |   5 +-
>   include/linux/wmi.h                           |  44 +-
>   18 files changed, 1477 insertions(+), 92 deletions(-)
>   create mode 100644 drivers/platform/wmi/internal.h
>   create mode 100644 drivers/platform/wmi/marshalling.c
>   create mode 100644 drivers/platform/wmi/string.c
>   create mode 100644 drivers/platform/wmi/tests/Kconfig
>   create mode 100644 drivers/platform/wmi/tests/Makefile
>   create mode 100644 drivers/platform/wmi/tests/marshalling_kunit.c
>   create mode 100644 drivers/platform/wmi/tests/string_kunit.c
>
