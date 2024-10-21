Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24211F819F
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729519893; cv=none; b=HT3IfBVVRK7us/XQd4IRUScTB48f/ydgldiEV9wFb9ycZzoRoazsFt/Ug1JqzfeJRAYwxNEnONlUqtGgW10nfs+ahr7TkyDWRkLdQKgthxkz97g8QyaE6+Qvs+RycMpIVeYIBPsJkEC0K+HA2LfudCs8VrOE1+enZWd10B7M8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729519893; c=relaxed/simple;
	bh=JF18tYPsQqVxAbKts7oP1MzMZ8i60IO6FY2VQX08NYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rw3L1PE2IvABSLwZuRAJqwqR6+9gDMG490kBecu7g75KSxudOdgR8n5SLG/k3/1GcXBOpeRBA/+d5y26TJpAHq6Z/2WLoRPnivFqp7C+dF3pUiHJkDI45gvdGfMVog8KDd6ICVdSfDAtH3wsO07QqH5FbotRAcmd73VoKgDB71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ssnk3cKq; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ssnk3cKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1729519880; x=1730124680; i=w_armin@gmx.de;
	bh=V8m1b7K0SYd8NxKGbjA6x6T9sB3lbTM18vAT6F7c6aE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ssnk3cKqHcqfsSY4zYXPgsFwuRbkG7kSAM25iUIwHxWOFWF7Cvp35zAY435PyAVr
	 lj2jIh0pzxttqyqJdlzlznPhBf8vIBZu95YnffmuePWPY9rb6zZ62oPSreM72KoSC
	 OJB5eXt3t9MgAZ4WB2oPpUdHUPir+vPqWE1FyQRNa7uqV35SY6tg0ANL08knhaESD
	 oE6ZFrcvGkQ/4O0GuGAjjVRaSrlYGRhMqBDvKzx4CMqKk7AcSjuOYNDW0rI9CWSE+
	 euVN8rvE15wxLTTwzIOylkwBbWpNwFqu14ZBULRWomwIG6T94DfpZjY4XC7o0JlUE
	 DsseeHsUrDre3SOGXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1tMLx51mhf-00KjgZ; Mon, 21
 Oct 2024 16:11:20 +0200
Message-ID: <c71c1e6d-539a-4647-aefb-fb2d901e36c9@gmx.de>
Date: Mon, 21 Oct 2024 16:11:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI
 documentation
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
 <20241021134654.337368-3-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241021134654.337368-3-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FpBquY8Yn+QraWjIhW5ccN6hRJQ7/KFzwq6Z/YtODNX9XHe1TyU
 PJZNtFiAld8TJJRSU97KLC1u4x9Jbx14UihNp/pZJ5BgM3GpfPiJ1OkjQdLtjcBhJNw9oun
 ln6vYt10SC7mGvSNV3ENX5yRPVziQaFs5RM5ilCBLb1hHWeBrzmqexgC0Ixp1rA+UpQiXdz
 b8Gb8FxKMW0/KJpwEzZHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1TBd6S8FYMU=;r7wN+4TBAb84+zSUEyKKPjnquuJ
 5SxU0ML19Z9BSkEcxtvByZt5nBFOZ1+yuHFck6tEqldYJPUiRbTupwIvmqwl+JpzIu156U8Mi
 QRZUzz/UaRkKtcDAZgipkIqlp2idxmsZv8dJoipyg/+xrBwfliRxJeMTyTP67tDBvsYX8Pr7Y
 c23QBUnWBswYB0ha4DQ33S9fzoxqEYnGLPi1deRVNlFTIkP/D+6H2/ECOhiZxNjveNWZv2C1o
 p+NO9cTY63TyzJ9I+dQMVOlDT/m9rt9r9gIFdC1EPtHvmjy1EQn+nRDGPkGr5b50oOgkwFPbJ
 mYY2DpGf/L8PCItjPGr+dLANhO10CITVZ1VPF4Vz5ZIEA5tDzGlrpEUJ+CtWGSUQZ9YI0/K2M
 qCc8YBS/FbiuZs0PBhHiLdq1AAPQbMplwwPE5k2p6K7U5w3RxInVmYkYEFRvx7Hwx3v+ueEkL
 pOqyMLYa3zCjASCgFT4iKm8L6rwYoOvV4s0/YEpQsvNgxbtqdPPjERmB/v/1Lk2biSQEP7/Hh
 O8lQLzAhUEVqo2WAqVwDm5EETqXObEDUA9td/s8JKooJVcpU3Fav7rrfiyxO9zaHVlMx4lQnX
 dB9Y/3rQTbQV/kFEKoHWPOBAwGKYiqfwISY574m5NZhTNLLt3ra046jb89hxqoUo/o/5Og36d
 njSi5POeQtYYCbtH9y0W0wtwaMguImfmu9OxsYm131pBi8Nq5fWKyF7ts04V8vpgFuWX2np9a
 A+PIaN8UVFYBVqzijQQvoHmROBzmoMwxf72UWWJXZRn2BQIsK5vFOsH/JLmMu3t+Jv6CfSlGl
 ldbT6Vwb/bplVBR8Dbo85AtVr2hlTyxwDFG1MO23BV8Lk=

Am 21.10.24 um 15:46 schrieb Basavaraj Natikar:

> Add documentation for the amd_3d_vcache sysfs bus platform driver
> interface so that userspace applications can use it to change mode
> preferences, either frequency or cache.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   .../sysfs-bus-platform-drivers-amd_x3d_vcache        | 12 ++++++++++++
>   MAINTAINERS                                          |  1 +
>   2 files changed, 13 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-driver=
s-amd_x3d_vcache
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3=
d_vcache b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vc=
ache
> new file mode 100644
> index 000000000000..5ff1f1a8c9b6
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcach=
e
> @@ -0,0 +1,12 @@
> +What:		/sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101:00/amd_x3d_mod=
e
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
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 11b829956499..ca9c666caf7f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -970,6 +970,7 @@ M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>   R:	Mario Limonciello <mario.limonciello@amd.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Supported
> +F:	Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
>   F:	drivers/platform/x86/amd/x3d_vcache.c
>
>   AMD ADDRESS TRANSLATION LIBRARY (ATL)
