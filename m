Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588A20C46C
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Oct 2024 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645811; cv=none; b=dNARWa9Zz14yfiGLP7TVfVnikLMaLw4Z9vnwPl2z3FFgYIGa4iSGm4gSFA3IOdHcGuTMS7Jz8Tzyft//plzeHKQ0JAEC5PZmE8CUwmS7AMSvbz1gmkYg+IBRiQhzUGXA03VpO5Vu8VwdoWRdnZBOU+3NG+PSkFHS17m6Bm/E5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645811; c=relaxed/simple;
	bh=MD6sxjvSnBst49ZvAwo/wSO39sIMRQDmVBhoaTggqW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0r5PL8d9BzCqUFHL98qyTBIMZ8F2BVbQvdqYR177FCIwFn9rBUB+l64OP3xDj4PRS9gRN66SZ+oW7Ht1GsahtaX4Qw4FTTCAKgo9uPzKk3W1WF3K8cae9ZHs0vyosVEtCLmATYNRKDkEBfCy2uaK2zzgy46vhdEEDDxBPg0rDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=a5v5xCU/; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="a5v5xCU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728645799; x=1729250599; i=w_armin@gmx.de;
	bh=faSKEbyI1xGZhypLPN43xnm18K709qd6rOOk63LwR10=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=a5v5xCU/lfRA4hO58BfpMQUXB9MUfjyt4oL45+50pKHK2RPrgMXUQ7Zw1pxhs14K
	 gmsy4+LVAF5SP+vkVr0jUAtj2q+iDnfEwK05+yMmLSnGmS4vJ9mqK2qkLil/Rwc8b
	 W+WNU6qYHLreX2lrL1sX5CDRu7cwsi+KbyOO2f/fKf4kPIyKRmmfW5RuF6cKFVKj6
	 LxcahEPzqmnLRr+8k06GMO8f696x13B/QGb9h2BWTiDUahw0ceVP+wbKISYhv9uRK
	 epSiZz7RLMp4I3y/3noU512P72TrSXlfFRoYDaXPqFhjyEhY2kyPje1s7gIhBHj2x
	 +mPN4dNeaYJ/kTjipA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.154.201] ([141.76.185.172]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42nY-1szDjq3glE-006OkE; Fri, 11
 Oct 2024 13:23:19 +0200
Message-ID: <cca099e4-a40c-4901-bf60-dca50ecbefb5@gmx.de>
Date: Fri, 11 Oct 2024 13:23:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI
 documentation
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
 <20241010094252.3892406-3-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241010094252.3892406-3-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ULevbEURTjD/OfZgo//GYS0Ckjg9Bemcd+POJSFLmVfV7oXKKny
 +kASMSDubcQygv12q/e17rf554wqpTarW5QDjg+I3t3eNE4MIH3Rlary9xBEF5Ux6nLpthQ
 PJCpAQUjbLzKdpjJJnsVLQUC2db2JAQ6+AsXjBFjJ5ej2gDqroY4gkEywBWFKkvDmj7Cs/4
 2IwbWor5tL1SG41UoCCEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:29nqztQl3DQ=;U+2BhZRLPl3xd0pQrYCJHaDlC/G
 I4jTZI/VsG+EK1PXZDTpQjw0o79eVmjFc9Y9OoEWd89CJTuR/zOaLRAE9w1bGipTUAiZQU2Ld
 AeJ2z0q1SfhQkY4YxpFajj4knEhst03fTJ/k5Ud1LKcm0b4DXb3RiLyx46rH+13EkWT77uoqk
 sP8oDtESvEtUQRIH8CPx5eSfGyvG0/CuXixZqcFZFfGtbQlCTFvpa9Swd9JXFyYVCqZqa8gu1
 dBTFPWj3PtItOXzjxJMUXKwOS1dGVe7hjykoLGWVRH3B7npMn+v6QpQpV8UEpwe6tsaW8tDtZ
 QmEq6VEiL8SR2Zu/ssMRDfp3VNTkTo2wruUFJiORMM5HPykcGbsUFXtEtNZZRC2lf0KbqnMks
 42hPn7Bhgbzd2Rd/XHiHM5l4s/uadNJqPeW7XnvI18yc/Re+87ysQfebfQCjyrW0ljSp1tQ48
 y9ZrL89TloDym1yVMmijDx6yHD9IlIPGjkj+t6yOaE4uIeabdeMZUbpQL//WJsy4P5W3+ckvO
 63qBRo5J66mA89ssaSo+VIEeVsGvGXYApqkgjVhH69v5Wg/AmXI5tKZ/Nn0shB2pi2tVzJqG5
 a5BlE+hdOEcmwtdMJQtnuBBZZ5jdNuTRL5GnRX7/cH/pUssMW3nGtQYT7AVF2e8SUipRWwedV
 yp/FrqN+pGiFodTTwXMXUSmRik/Uz8S03ZBUbfBHvWNOoFV0O3zeCXBOqZibqA5F9vSjXsask
 VWjVzaBoRBRzCNxnNFbRgXMl3ObAmGcze74yn3CHfGN8TfIaEiGC27ai/gZ+8TJ3l1UVGArhi
 gGdTQuqHsC+Y9k0yBtKOdaXdX6dmbzaAMPUWk+xQeOkO4=

Am 10.10.24 um 11:42 schrieb Basavaraj Natikar:

> Add documentation for the amd_3d_vcache sysfs bus platform driver
> interface so that userspace applications can use it to change mode
> preferences, either frequency or cache.
>
> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   .../sysfs-bus-platform-drivers-amd_x3d_vcache      | 14 ++++++++++++++
>   MAINTAINERS                                        |  1 +
>   2 files changed, 15 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-driver=
s-amd_x3d_vcache
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3=
d_vcache b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vc=
ache
> new file mode 100644
> index 000000000000..1aa6ed0c10d9
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcach=
e
> @@ -0,0 +1,14 @@
> +What:		/sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101\:00/amd_x3d_mo=
de

AMDI0101\:00 -> AMDI0101:00

> +Date:           October 2024
> +KernelVersion:	6.13
> +Contact:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> +Description:	(RW) AMD 3D V-Cache optimizer allows users to switch CPU c=
ore
> +		rankings dynamically.
> +
> +		This file switches between these two modes:
> +		- "frequency" cores within the faster CCD are prioritized before
> +		those in the slower CCD.
> +		- "cache" cores within the larger L3 CCD are prioritized before
> +		those in the smaller L3 CCD.
> +
> +		Format: %s.

What is the purpose of "Format: %s"?

Thanks,
Armin Wolf

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61cb6a294f4c..c7e807770438 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -977,6 +977,7 @@ M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>   R:	Mario Limonciello <mario.limonciello@amd.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Supported
> +F:	Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
>   F:	drivers/platform/x86/amd/x3d_vcache.c
>
>   AMD ADDRESS TRANSLATION LIBRARY (ATL)
