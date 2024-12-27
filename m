Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183427447;
	Fri, 27 Dec 2024 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735271057; cv=none; b=csZ9+hWF00lG7LRy6qkkAiaT0KRqjmTEg50ckgDGdpOvxZrgvoKtno1CagODhBLfnuJXja0TWHrAmiCDCw2Atvnh/Y0HGdU/a5HznF1eHA8XAHqYNsnMSx5topoBLnGGl+A8eiG5JHUjqPqRozNK1WA3FsDir1Bp7RtXLn5nT8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735271057; c=relaxed/simple;
	bh=R5uGLYwkz4rD6Kcg8aty+ACwzJRYCVkqBqjiR1FCSnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0hpg0UWDIl50BAMwc4SzjG1jUAO+Z+qNF4MzIHWc+qY5jLyOPCKvXvwcJG+KnuP0K4GC2E/X+MyT8RoaouiDSVzwJcQrlHpl+6JHwLQmMAjU/eCkEQmchGldmCrw8wn2tNmMcB/rfcNCI5UIuKYkSiDaCli+DJgLdIpiySpcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CA3jIe4O; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CA3jIe4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735271039; x=1735875839; i=w_armin@gmx.de;
	bh=F+muPGNFK9b9evzOwpQnxC1uRYT7uiv75phDMFlr7tE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CA3jIe4OOWpO8nijax6duG1petiT19J5U5btcKMQw2yUfVgCdzKvIwvV33/nXZBl
	 8S+UWIkyDEvbdUZG1YnNuhkD3Knpm2hAeUqKacuF93jepXtCb/gX2B+CloOTb8f6d
	 QWbHiaToWd3hMu6UF2nUdsPAmRQeACWK0BG8p87aEtYjpZEk/bjsccLL8Q08qhUig
	 buJD7s5yOcYYcmtZrXYExHmnG1CytRLqalSlveZvjjLpt2yJ/+sxzprougTmG9ZVb
	 ycxj8BsBu2IWEIbz+lJK8+NdgVsB7UnLEAh/7gL1rK61pGv/tKHQl1/XEte9bFYem
	 /N12BIdbMS0pTTKE3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDIu-1trWNb02dc-00jXGC; Fri, 27
 Dec 2024 04:43:59 +0100
Message-ID: <9abda5f5-5f30-48b5-81a1-d4439995245b@gmx.de>
Date: Fri, 27 Dec 2024 04:43:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] alienware-wmi: Refactor hdmi, amplifier, deepslp
 methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-12-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-12-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WAf0stQgdnyimyLlJUnpYhWYw3X/scXWveGbomydzJdieL2J9WX
 50cQ7kqQVcODruE7IrZv4FHIlzts2aNf1NIfhL5H3h/c/vb2Q3A+73WS6HfSvkbL+vPjvtp
 hV1zEw750FolGpFOI5ObML2Lw6AvyUQSvZTIpGL8/t94dLsSzu4LUlznOT15o6JiQsYhCRR
 F6D9SSIb+DFThgX9fyJXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tkH6+LeogHk=;mVIKx8HN55I+1tMhW+rMShsGswJ
 +/+nmSQt/o/vgUd+W4wjyKkNzqhypF9TIcFJKBn5snV9z/CKAznue+JFpyP6C0FRr1QwUnk1r
 KajqjXffnvSHlMlkSkgQIHw/7TRBjbU9hjrUDp4YHJ+cDPC8xRRwVczXzCLHtzhY/78bMLfNN
 nK2JAIX6YxSGD2nUXA2282uaq89siMmL+i9MOZSzkm/T4TkPHNgww2DUHMUOKBPQHh8xCdZ9C
 BR0LPKmUxr7lBVNzbwt1IgA3rY1lAY9Fy/CkzzPZhs+VAbmuP9352HOjx806xVKB0cfwikjPB
 ouj68eB0YWzituwMxgXYAw5BgQypEPCXyBAkvM0beY8seifRAMECodjV6uPZNS1PdfCLj50uB
 oWBZwXRMDcfWHWyOj1ybJl31vcha8ykdZeGLftTYCpbXFzPNIW0KM8mjuC+WbCBvN0P+AVN41
 +B9gmxxbyfdjrKs4bvPVEnSaxP9Ez/QVLUnTfBE6Vx6Ng4qplzO6HE+qm3iKpCwgVuXI00iOK
 38KNDKoZfZ+kKDUxFxhGM+tlU3hS+T/JwugNVxmmxtLItWYtJux0SncJq3SfJy1l12zpML2sF
 Qr/rvWp6n5eAgsxxSoh1ywQP1frdz5MO03hPYyxOiOC4Q5SyAWmLiqpv7omRY9IIURtwHxfqU
 xNiVK+ra5J0lNpAuUUMu2dtwclT1L+cck749yX+UFLvqbCmmxveymPZRsnb7YF2+Mj5pN0RaC
 V+Byrah8/L4VAJeO8E//S9TimggUs8JHGD/CEIMzSojwuTvgi/qudVVcfuxbde+vEXqmHBFYW
 Bps7QtuZTvgnxi59CaBhy2wM27Ie0dwDXR46ZsMV6CCwIKYIotLtaIidxhWodrCgeXqMXV0JU
 bovrtLHhc1il+RLL2Wjhiv3lDdjLwBDrwG3GhNGfNd5NBT9MnabRgvg9g4uRU/avMNLhM0qD5
 pYEw0Rfzjrge7N6Rh1ihyeyL9toTl/HksCxmnT5uFhtwZn8IQSoTV54034M956EenwXqo9DzE
 80dYhhwUOuDOO5TilHOHAGitjBRsZ4vlnSUh7u/x9ExIk3FW87JaumVDwQSaCUedOpf+Jz+vN
 frlQmAIO3yLndYYBP5WoizJvcuvU+t

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
> use alienware_wmi_command() instead of alienware_wmax_command() which
> uses deprecated WMI methods.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 51 ++++++++++++++++-------
>   1 file changed, 36 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index bcf3b2f80dfd..b9da5fe657a9 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -685,14 +685,18 @@ static acpi_status alienware_wmax_command(void *in=
_args, size_t in_size,
>   static ssize_t show_hdmi_cable(struct device *dev,
>   			       struct device_attribute *attr, char *buf)
>   {
> +	struct alienfx_platdata *pdata;
>   	acpi_status status;
>   	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> -	status =3D
> -	    alienware_wmax_command(&in_args, sizeof(in_args),
> -				   WMAX_METHOD_HDMI_CABLE, &out_data);
> +
> +	pdata =3D dev_get_platdata(dev);
> +
> +	status =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
> +				       &in_args, sizeof(in_args), &out_data);
> +
>   	if (ACPI_SUCCESS(status)) {
>   		if (out_data =3D=3D 0)
>   			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> @@ -706,14 +710,17 @@ static ssize_t show_hdmi_cable(struct device *dev,
>   static ssize_t show_hdmi_source(struct device *dev,
>   				struct device_attribute *attr, char *buf)
>   {
> +	struct alienfx_platdata *pdata;
>   	acpi_status status;
>   	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> -	status =3D
> -	    alienware_wmax_command(&in_args, sizeof(in_args),
> -				   WMAX_METHOD_HDMI_STATUS, &out_data);
> +
> +	pdata =3D dev_get_platdata(dev);
> +
> +	status =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
> +				       &in_args, sizeof(in_args), &out_data);
>
>   	if (ACPI_SUCCESS(status)) {
>   		if (out_data =3D=3D 1)
> @@ -729,8 +736,12 @@ static ssize_t toggle_hdmi_source(struct device *de=
v,
>   				  struct device_attribute *attr,
>   				  const char *buf, size_t count)
>   {
> +	struct alienfx_platdata *pdata;
>   	acpi_status status;
>   	struct wmax_basic_args args;
> +
> +	pdata =3D dev_get_platdata(dev);
> +
>   	if (strcmp(buf, "gpu\n") =3D=3D 0)
>   		args.arg =3D 1;
>   	else if (strcmp(buf, "input\n") =3D=3D 0)
> @@ -739,8 +750,8 @@ static ssize_t toggle_hdmi_source(struct device *dev=
,
>   		args.arg =3D 3;
>   	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
>
> -	status =3D alienware_wmax_command(&args, sizeof(args),
> -					WMAX_METHOD_HDMI_SOURCE, NULL);
> +	status =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE,
> +				       &args, sizeof(args), NULL);
>
>   	if (ACPI_FAILURE(status))
>   		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
> @@ -778,14 +789,17 @@ static const struct attribute_group hdmi_attribute=
_group =3D {
>   static ssize_t show_amplifier_status(struct device *dev,
>   				     struct device_attribute *attr, char *buf)
>   {
> +	struct alienfx_platdata *pdata;
>   	acpi_status status;
>   	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> -	status =3D
> -	    alienware_wmax_command(&in_args, sizeof(in_args),
> -				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
> +
> +	pdata =3D dev_get_platdata(dev);
> +
> +	status =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CA=
BLE,
> +				       &in_args, sizeof(in_args), &out_data);
>   	if (ACPI_SUCCESS(status)) {
>   		if (out_data =3D=3D 0)
>   			return sysfs_emit(buf, "[unconnected] connected unknown\n");
> @@ -822,13 +836,17 @@ static const struct attribute_group amplifier_attr=
ibute_group =3D {
>   static ssize_t show_deepsleep_status(struct device *dev,
>   				     struct device_attribute *attr, char *buf)
>   {
> +	struct alienfx_platdata *pdata;
>   	acpi_status status;
>   	u32 out_data;
>   	struct wmax_basic_args in_args =3D {
>   		.arg =3D 0,
>   	};
> -	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
> +
> +	pdata =3D dev_get_platdata(dev);
> +
> +	status =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_S=
TATUS,
> +				       &in_args, sizeof(in_args), &out_data);
>   	if (ACPI_SUCCESS(status)) {
>   		if (out_data =3D=3D 0)
>   			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
> @@ -845,9 +863,12 @@ static ssize_t toggle_deepsleep(struct device *dev,
>   				struct device_attribute *attr,
>   				const char *buf, size_t count)
>   {
> +	struct alienfx_platdata *pdata;
>   	acpi_status status;
>   	struct wmax_basic_args args;
>
> +	pdata =3D dev_get_platdata(dev);
> +
>   	if (strcmp(buf, "disabled\n") =3D=3D 0)
>   		args.arg =3D 0;
>   	else if (strcmp(buf, "s5\n") =3D=3D 0)
> @@ -856,8 +877,8 @@ static ssize_t toggle_deepsleep(struct device *dev,
>   		args.arg =3D 2;
>   	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, bu=
f);
>
> -	status =3D alienware_wmax_command(&args, sizeof(args),
> -					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
> +	status =3D alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_C=
ONTROL,
> +				       &args, sizeof(args), NULL);
>
>   	if (ACPI_FAILURE(status))
>   		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
