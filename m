From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] intel_menlow: reduce code duplication
Date: Sat, 26 Mar 2016 16:53:03 -0700
Message-ID: <1459036383.23450.12.camel@perches.com>
References: <1459028427-4053-1-git-send-email-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459028427-4053-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sujith Thomas <sujith.thomas@intel.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2016-03-26 at 22:40 +0100, Rasmus Villemoes wrote:
> aux0_show and aux1_show consists of almost identical code. Pull that
> into a common helper and make them thin wrappers. Similarly for
> _store.

Seems sensible, thanks

> diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x=
86/intel_menlow.c
[]
> @@ -306,33 +306,32 @@ static int sensor_set_auxtrip(acpi_handle handl=
e, int index, int value)
> =A0#define to_intel_menlow_attr(_attr)	\
> =A0	container_of(_attr, struct intel_menlow_attribute, attr)
> =A0
> -static ssize_t aux0_show(struct device *dev,
> -			=A0struct device_attribute *dev_attr, char *buf)
> +static ssize_t aux_show(struct device *dev, struct device_attribute =
*dev_attr,
> +			char *buf, int idx)
> =A0{
> =A0	struct intel_menlow_attribute *attr =3D to_intel_menlow_attr(dev_=
attr);
> =A0	unsigned long long value;
> =A0	int result;
> =A0
> -	result =3D sensor_get_auxtrip(attr->handle, 0, &value);
> +	result =3D sensor_get_auxtrip(attr->handle, idx, &value);
> =A0
> =A0	return result ? result : sprintf(buf, "%lu", DECI_KELVIN_TO_CELSI=
US(value));

While not something you've done differently than the
existing code, perhaps this would be more common
without the ternary operator like:

	result =3D sensor_get_auxtrip(attr->handle, idx, &value);
	if (result < 0)
		return result;

	return=A0sprintf(buf, "%lu", DECI_KELVIN_TO_CELSIUS(value));
