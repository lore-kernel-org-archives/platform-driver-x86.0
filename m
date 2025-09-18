Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752BD1A3166
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Sep 2025 04:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758171438; cv=none; b=sJk2PfJLoMftCf2wHFqp55dZQH7cKROSv1DWS4Qdk32dVzsAv+Qqrc/VWirlqcnUm6hqyjKQNV3fJKf0Mwqa3FlYiSDRu172M3qN36YKTNa51zzJgpHnB0dmLa18SdmZj9mR60FUoyP1ba3sIGeWID3nw6g42lJ+fWJiO1vdbco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758171438; c=relaxed/simple;
	bh=lkgMkw6Ydhe03adnRNAoBFKTwIQAJm/t0sG+KGJwiIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cs73pcTQYq7smKcInP+V8Qp90yTR5VhzfS1kyJXEbJtsMHFp4q+gS8+yhjGLQz4K/vPqO7QInPQYASnxvOpWM9HK7q5+D0W9icnZcmFAGDJdHo4OLQit9kqld8RWTURq3Deu88FrlZfBHFolZMqHzDonLXbgsssv3K5Xwm9I3Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ9NBvNz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ9NBvNz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-26983b5411aso3232255ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Sep 2025 21:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758171435; x=1758776235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WGymaOnCc4o9eO/QJxcY/8uIl/0McYtbmQsOfMiDvkQ=;
        b=lQ9NBvNzNgd1jRsKWzn5mlDa/s5sf41Uymscr5CNYTNjMtabZVUGOG81RtUrwSvHw6
         9j6waqZIsmUOIFM3UMVPiNknNlkxBeU2v2OWHWumk/QyRsTDuSV2vFA3f+AEs5PR7S5m
         yHvdlkMhqK0NGYklwuUVtEbdWUmErWUSiskRRi6RFN68pWhQRcdTJssr6Ylh5AsmygRG
         7tItkMVc2ab2orSefa+mrBZxv9mpFS1cBkstCndUeexqUsBjpXqsWlc91UxMYnY5b3g9
         wyQNcnncrR3Z5RHJ70r1j9Y96nTBElrQfdBXS1YmXkOD5RX+xBZfhwXQmsAFl8unmvpS
         U57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758171435; x=1758776235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGymaOnCc4o9eO/QJxcY/8uIl/0McYtbmQsOfMiDvkQ=;
        b=Xw8ibO+vFqhokRX9++fCsoc8ZtaNbrURCGuJULUHSaFi/KN9ztY+QTmRN5OMZqdgse
         DuoVlimzeYyfZQKRuID4dLxY1ChFMIEGyG06ckC0sxmW2KYysJQGD0+riqNgyReQaKcK
         zhYsuEqXlEbegoS6oHd4c5F2Ir9mQlpbwU/RK6VbuLsheP+BluGRkKXp4Jl2xLZet8OM
         jVxPq60k5B11oYy4RN+IFu78eTBACY8vs6Lk7t9Av1m7dYunK9xbaWF1lXgMuEOVGQP0
         KARGFa6ae456tQgFpwSZoRs6y51+pamP5rPCLXw9db7FuM3hl+cTR3uT16tFu/oP6d+q
         25mA==
X-Forwarded-Encrypted: i=1; AJvYcCXqz6IAXV9k/6wxF8NZhRHpJglT8QvVJCuMTgy6wveynI0wIs4RDMwDFvE73bFSfMQSQUiFEwPmNabc/jV0GmdTi6t1@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+QxcBcgbK40OloCwBzKOP9OGRWY3e9fnM7L6+BT9sc9pWrPO
	YTpywewT95e/N5iMXrmnDPtORFIUS6dTdI3UTFFdTyysbyj+AvKMu+za
X-Gm-Gg: ASbGncuff/43F5uHBpQ3S8pcna/mcM5c7bF4bHjjkrad3gQTFiBN9Nsunlyksm+YDCC
	inYwsF5mxLdRWoq4nBoK4e6otxarUdFZR7VTjMST0r+PxeBAlWGX7i9z92h2zpy/mddPz9Y/dTY
	MX0LwK07DfQyeFNWhI6NVMr97Iuq/X/rgfSq7lT9fcMoi9cOx5n5EBeYRmABZvXdBz5SSeh6pxb
	M/RLUFoiCAsBAJbCGfqgT4oKz0tVQ38P8kxYe4jhcYgUQkCD+9vc5l8WlQ7qjIS5KV+jepyImw2
	+6ARK2XkmOxSNktw3eVp9rxucqprE+5RlBta6Z2hpcUjpm3QOvX5jcuaif6IKL9l7frtUT8AFua
	4O4N798fltKmvuLNu/nTs9v9zndICqMUcrMkZF3wKZoUeUk7V810F
X-Google-Smtp-Source: AGHT+IF+Aq/tQGZ2xe55EOY/2o43Lc1MLCWnLjxi4HUvMhJ5KCylwUxEphTLkETS8bUOBSE9459K6w==
X-Received: by 2002:a17:903:2312:b0:269:603f:41e2 with SMTP id d9443c01a7336-269603f4366mr45706565ad.21.1758171434394;
        Wed, 17 Sep 2025 21:57:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c081sm12493815ad.41.2025.09.17.21.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 21:57:14 -0700 (PDT)
Date: Wed, 17 Sep 2025 21:57:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: hmh@hmh.eng.br, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	derekjohn.clark@gmail.com, mpearson-lenovo@squebb.ca, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v3 1/3] input: mouse: trackpoint: Add doubletap
 enable/disable support
Message-ID: <cr7jgtztf65balwxu6cpu6hqzzzluitrwu2f66o75kcip5k2zd@sxixvhotead5>
References: <20250901135308.52340-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901135308.52340-1-vishnuocv@gmail.com>

Hi Vishnu,

On Mon, Sep 01, 2025 at 10:53:05PM +0900, Vishnu Sankar wrote:
> Add support for enabling and disabling doubletap on TrackPoint devices
> that support this functionality. The feature is detected using firmware
> ID and exposed via sysfs as `doubletap_enabled`.
> 
> The feature is only available on newer ThinkPads (2023 and later).The driver
> exposes this capability via a new sysfs attribute:
> "/sys/bus/serio/devices/seriox/doubletap_enabled".
> 
> The attribute is only created if the device is detected to be capable of
> doubletap via firmware and variant ID checks. This functionality will be
> used by platform drivers such as thinkpad_acpi to expose and control doubletap
> via user interfaces.
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> Changes in v2:
> - Improve commit messages
> - Sysfs attributes moved to trackpoint.c
> - Removed unnecessary comments
> - Removed unnecessary debug messages
> - Using strstarts() instead of strcmp()
> - is_trackpoint_dt_capable() modified
> - Removed _BIT suffix and used BIT() define.
> - Reverse the trackpoint_doubletap_status() logic to return error first.
> - Removed export functions as a result of the design change
> - Changed trackpoint_dev->psmouse to parent_psmouse
> - The path of trackpoint.h is not changed.
> Changes in v3:
> - No changes.
> ---
>  drivers/input/mouse/trackpoint.c | 149 +++++++++++++++++++++++++++++++
>  drivers/input/mouse/trackpoint.h |  15 ++++
>  2 files changed, 164 insertions(+)
> 
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
> index 5f6643b69a2c..c6f17b0dec3a 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -16,6 +16,8 @@
>  #include "psmouse.h"
>  #include "trackpoint.h"
>  
> +static struct trackpoint_data *trackpoint_dev;

Please do not use globals.

> +
>  static const char * const trackpoint_variants[] = {
>  	[TP_VARIANT_IBM]		= "IBM",
>  	[TP_VARIANT_ALPS]		= "ALPS",
> @@ -63,6 +65,21 @@ static int trackpoint_write(struct ps2dev *ps2dev, u8 loc, u8 val)
>  	return ps2_command(ps2dev, param, MAKE_PS2_CMD(3, 0, TP_COMMAND));
>  }
>  
> +/* Read function for TrackPoint extended registers */
> +static int trackpoint_extended_read(struct ps2dev *ps2dev, u8 loc, u8 *val)
> +{
> +	u8 ext_param[2] = {TP_READ_MEM, loc};
> +	int error;
> +
> +	error = ps2_command(ps2dev,
> +			    ext_param, MAKE_PS2_CMD(2, 1, TP_COMMAND));
> +
> +	if (!error)
> +		*val = ext_param[0];
> +
> +	return error;
> +}
> +
>  static int trackpoint_toggle_bit(struct ps2dev *ps2dev, u8 loc, u8 mask)
>  {
>  	u8 param[3] = { TP_TOGGLE, loc, mask };
> @@ -393,6 +410,131 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
>  	return 0;
>  }
>  
> +/* List of known incapable device PNP IDs */
> +static const char * const dt_incompatible_devices[] = {
> +	"LEN0304",
> +	"LEN0306",
> +	"LEN0317",
> +	"LEN031A",
> +	"LEN031B",
> +	"LEN031C",
> +	"LEN031D",
> +};
> +
> +/*
> + * checks if it’s a doubletap capable device
> + * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
> + */
> +static bool is_trackpoint_dt_capable(const char *pnp_id)
> +{
> +	const char *id_start;
> +	char id[8];
> +
> +	if (!strstarts(pnp_id, "PNP: LEN03"))
> +		return false;
> +
> +	/* Points to "LEN03xxxx" */
> +	id_start = pnp_id + 5;
> +	if (sscanf(id_start, "%7s", id) != 1)
> +		return false;
> +
> +	/* Check if it's blacklisted */
> +	for (size_t i = 0; i < ARRAY_SIZE(dt_incompatible_devices); ++i) {
> +		if (strcmp(id, dt_incompatible_devices[i]) == 0)
> +			return false;
> +	}
> +	return true;
> +}
> +
> +/* Trackpoint doubletap status function */
> +static int trackpoint_doubletap_status(bool *status)
> +{
> +	struct trackpoint_data *tp = trackpoint_dev;
> +	struct ps2dev *ps2dev = &tp->parent_psmouse->ps2dev;
> +	u8 reg_val;
> +	int rc;
> +
> +	/* Reading the Doubletap register using extended read */
> +	rc = trackpoint_extended_read(ps2dev, TP_DOUBLETAP, &reg_val);
> +	if (rc)
> +		return rc;
> +
> +	*status = reg_val & TP_DOUBLETAP_STATUS ? true : false;
> +
> +	return 0;
> +}
> +
> +/* Trackpoint doubletap enable/disable function */
> +static int trackpoint_set_doubletap(bool enable)
> +{
> +	struct trackpoint_data *tp = trackpoint_dev;
> +	struct ps2dev *ps2dev = &tp->parent_psmouse->ps2dev;
> +	static u8 doubletap_state;
> +	u8 new_val;
> +
> +	if (!tp)
> +		return -ENODEV;
> +
> +	new_val = enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE;
> +
> +	if (doubletap_state == new_val)
> +		return 0;
> +
> +	doubletap_state = new_val;
> +
> +	return trackpoint_write(ps2dev, TP_DOUBLETAP, new_val);
> +}
> +
> +/*
> + * Trackpoint Doubletap Interface
> + * Control/Monitoring of Trackpoint Doubletap from:
> + * /sys/bus/serio/devices/seriox/doubletap_enabled
> + */
> +static ssize_t doubletap_enabled_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct serio *serio = to_serio_port(dev);
> +	struct psmouse *psmouse = psmouse_from_serio(serio);
> +	struct trackpoint_data *tp = psmouse->private;
> +	bool status;
> +	int rc;
> +
> +	if (!tp || !tp->doubletap_capable)
> +		return -ENODEV;
> +
> +	rc = trackpoint_doubletap_status(&status);
> +	if (rc)
> +		return rc;
> +
> +	return sysfs_emit(buf, "%d\n", status ? 1 : 0);
> +}
> +
> +static ssize_t doubletap_enabled_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct serio *serio = to_serio_port(dev);
> +	struct psmouse *psmouse = psmouse_from_serio(serio);
> +	struct trackpoint_data *tp = psmouse->private;
> +	bool enable;
> +	int err;
> +
> +	if (!tp || !tp->doubletap_capable)
> +		return -ENODEV;
> +
> +	err = kstrtobool(buf, &enable);
> +	if (err)
> +		return err;
> +
> +	err = trackpoint_set_doubletap(enable);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(doubletap_enabled);
> +
>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>  {
>  	struct ps2dev *ps2dev = &psmouse->ps2dev;
> @@ -425,6 +567,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>  	psmouse->reconnect = trackpoint_reconnect;
>  	psmouse->disconnect = trackpoint_disconnect;
>  
> +	trackpoint_dev = psmouse->private;
> +	trackpoint_dev->parent_psmouse = psmouse;
> +
>  	if (variant_id != TP_VARIANT_IBM) {
>  		/* Newer variants do not support extended button query. */
>  		button_info = 0x33;
> @@ -470,6 +615,10 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>  		     psmouse->vendor, firmware_id,
>  		     (button_info & 0xf0) >> 4, button_info & 0x0f);
>  
> +	tp->doubletap_capable = is_trackpoint_dt_capable(ps2dev->serio->firmware_id);
> +	if (tp->doubletap_capable)
> +		device_create_file(&psmouse->ps2dev.serio->dev, &dev_attr_doubletap_enabled);

Please use existing facilities in psmouse driver to define and register
protocol-specific attributes. Use is_visible() to control whether the
attribute is accessible or not.

Thanks.

-- 
Dmitry
