Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B143191BD
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Feb 2026 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769933405; cv=none; b=eK519VPiS2F720lxu16Qxt2kqXBUqzrbzbLQBTTDnUESgbVZy61k6nfWBjJ69wIvrPLQkUaVYQlAgRPC7onxV1KnZ9OvSuBhtSSXqsPRn30TrmXNni5qpCSRS0Y2tGdI56gZ9HEXUjxNIWdYhNzJnebBO0qBTFcQGnXzI58mxCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769933405; c=relaxed/simple;
	bh=weBSH2/B8nDrlAu3pF5x2Dr89pPcOECnGV6bRY1zB1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKufGM8yX438YtKu4znf6OKCsraXFqPyw93RFrvBAd8J2txIIiDe8PhGkoea8X/tkjWo6AP1Z1tmDKe6W0/6Zr3R0Vf5IfzC6dScS4AHwKZ/5m0o7fKFQRg47siSgn7RQ/mB6S4woY78ByMou9mvR8A7EvdNA1VGOASFoAZzt2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItGLhCSI; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItGLhCSI"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso6720076eec.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Feb 2026 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769933403; x=1770538203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKJM5FekupxGXax7BEjPAzFs9OgvHeN0OQc3ubwHQ3o=;
        b=ItGLhCSI3mCVIc1dy8R5odE4pwPM+sxo7HOZynwWuM18Cb7wKqehycOOcKRHKazibj
         iDVE7PnY6H4/3snh11AX0+KCook2w5K3xaLb7W1c7ciYrnYif5Z8EcwLa5nfFQK8ox/1
         eq7st4AmDmMf7Db0JGZSpOyiQbxl1dZAHqyjYnfGAhaa7LhXe100pW5UU7qUix62VLO/
         +HqNq9q62DfTbEN+fKfXllu/Gl2PVe4dZU2M1yzLCFwi4IRx1Drr61vIaK29yC6YPOUB
         sq8PQPfOvVKTWFMXq3hCgfDJAXjUJdJVhQEei7Fl7f8jbj2oXNeeLfafOBQJC9mhrKV/
         bGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769933403; x=1770538203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKJM5FekupxGXax7BEjPAzFs9OgvHeN0OQc3ubwHQ3o=;
        b=CtCPCY9DevXH6Vmnahbg9633Swih7RCCf8wf+bcAwv+K65yTpGLj/z4NQJiGOzMIP7
         EwnVA4xfduSPeH8VCkqxe7WCsE2uwWk0TbWtokPtGW+ntdHQ1n9ngKOSUUTVoUREzrk7
         VFlFvWLZreclfqzrG71gRCNYLPn7yhMurSTaQUxWWHa/OUSQ/Z3Pvj/XN29RMNGYnivD
         436lCueM0bPS9lYkoxYxQKPhY2Gv3mElI+BpJSkB8c+q8hn4v158ffAb1ZVdbSmnZBiK
         dyeggzvZgbaYPwEDmmH2zSe9SbW0L62+vxrzs8nLdP4Gk2WaG0p2QAiG1kJ8sHyQqpoz
         YO4g==
X-Forwarded-Encrypted: i=1; AJvYcCUVrYzm/U8BriWi2lKXCWGgrLwsxSrEeSm033FocjBI407pj+P0s1nPDEpx/p70H44n1ZDYKs6L7QUbYuL+JOTxVsxC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw73QkAN7OdohDd5DmIjSSWKFHUKJgau4hTOP1XsnI5mMK+zelU
	pBWWTDbHDAN0KH20oz8QMtgYUfw4t80oQcYU9n/OzGimTnIpXY+fHn/A
X-Gm-Gg: AZuq6aI3+bO0hB6yAUTf7XvI416db0Rhc/mcJ6/ExI4osNn/0KRoXxwzbvk2LNjclqT
	WwDda8J9zLWvNZvmduH4Wn5tSzs9i2uwIlnhgF7VDPcmpxM/GM2dm288bXUrTGqVj5bR4YGqhvy
	8BjO2v/D3dEDk3S1KrQzqkIYWpjaBlVQ3s9ZfsbkKZGaIGwA/7RW4QECTdLrLGg5FgEo2LwDwgK
	kdbTdJcIeLvgS2yzCTDdxQwXwT+fk6DLgzfJRuGcxLBMkrqpWJyhD32U3+mj78yoX1RZuJSFo6V
	CpdZiw9UijXvxotUTPoYFIdKJWPJs+Kru5E1LY9Odu0jWRcwUtKsGbQT5kSCThvbyvN0qSqgz/x
	Hkr0NiBDNa3Il/LjR2u5prelFGFgmVDkVtTamrigLRU1hAwobEpsZdOIJrXAHtOma9xCVvqaeHC
	KPYSt4Y+HByoiRzHU3rYBtPJcv
X-Received: by 2002:a05:7300:2151:b0:2b6:f0fc:8c47 with SMTP id 5a478bee46e88-2b7c8664427mr3028848eec.16.1769933402697;
        Sun, 01 Feb 2026 00:10:02 -0800 (PST)
Received: from google.com ([205.220.129.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm17783605eec.26.2026.02.01.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 00:10:02 -0800 (PST)
Date: Sun, 1 Feb 2026 08:09:34 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: mpearson-lenovo@squebb.ca, hmh@hmh.eng.br, hansg@kernel.org, 
	corbet@lwn.net, derekjohn.clark@gmail.com, ilpo.jarvinen@linux.intel.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Subject: Re: [PATCH v6 1/3] input: trackpoint - Enable doubletap by default
 on capable devices
Message-ID: <aX8JwB7F8_ypJRAz@google.com>
References: <20260127103907.20269-1-vishnuocv@gmail.com>
 <20260127103907.20269-2-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127103907.20269-2-vishnuocv@gmail.com>

Hi Vishnu,

On Tue, Jan 27, 2026 at 07:39:05PM +0900, Vishnu Sankar wrote:
> @@ -470,6 +509,14 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>  		     psmouse->vendor, firmware_id,
>  		     (button_info & 0xf0) >> 4, button_info & 0x0f);
>  
> +	/* Enable doubletap by default on capable devices */

This is obvious from the code, please drop the comment.


> +	if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
> +		if (trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBLETAP_ENABLE))
> +			psmouse_warn(psmouse, "Failed to enable doubletap: %d\n", error);
> +		else
> +			psmouse_info(psmouse, "Doubletap enabled by default!\n");

Drop psmouse_info(), no need to make the driver too noisy.

Otherwise:


Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
