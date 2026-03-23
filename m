Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA92FE582
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 22:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305782; cv=none; b=PJ7byMoXI9DKVQ5SrJt+eirhJScpu+ldg4pBp1IH71TXrJfJfi3mqdITig6PYFgr6X1x1WqO+dL2e14OaA0bQZ6EEKRD+VXi7//NTvfmqKEg07euE4KTG//i3ZvHcu6fk87RBmL/2Lc3IuN0EPYmLCB3ubw3HPR+ngMmpzgQjAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305782; c=relaxed/simple;
	bh=eY/l0pNNsKlt6FeaeoIeAQ6qCqKnez5RHCGxpugoodE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qF16Fe7br0ii8rkZ3ATKbRorZLidLsg0C1I1GNDhG/dNX2zaY4JY39sQgImXdNWRsXd378Uyjw0iObZMkqwt6Tl9dlYqkPQPd3g8BWSfn8/QKj3Gs5yTFRa43vCn0C5US0lvP0rLMldzyUfbHrV2xixxpDfQpbX96UVgxWuiqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5iHer8+; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5iHer8+"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3787631eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Mar 2026 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774305779; x=1774910579; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQitIt/VZw/RqI0BD0y4OU+WxRTPVb199E6XKyMY7/Q=;
        b=S5iHer8+Wnl5ZzYCAfoF4fwqEgYhS3LdYaWGfqntIOdJcJhcZMKE0BU3Z27erlhGEu
         L0AcL2T1C56CLJ12HVI1cYGCwTafMVpAPjzy/zy7Yhp8wSHuKNOei3LkaMeNugtcrDJ6
         egXyzIc0N/ynPxUQiCnbUjLsXF2oyVaV9CejMWzv/mK/EtG/2JqaKExJ7sAtarGmMJtU
         qv1lGz8mNs+dVY+q7eU+R+9ogHNRIZ2m6MQ2QtepUvA2NiHOZ3Nxmv4orPpicrzmVu4V
         W6U3sUPpUZCHaMO0jRSdQE1Kpy64UwWHMBVYYHKEVUvfde5O89O74Sq0NztF0f8sktgH
         BNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305779; x=1774910579;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQitIt/VZw/RqI0BD0y4OU+WxRTPVb199E6XKyMY7/Q=;
        b=T3HcMArsWw/uoGz1mHlnr7zb1xZ2M+ctWMKr/irBU8HRp9LMwn9hD47lIiq/iLSepg
         oy9eTM3HNrRJRLWJLE5qfZNnPnll0A5SF1XS6Njo8I5K6ivpEQ6dLDNXhoeGB0gfYd8K
         lwlM3eO44oynOzVvbX/luQdC5NOW/laICEPIF+S4JOzmSDGwIR5X3gA+C3TAXSitDYyx
         ExN5B61ttuvupTTv1X1buKMkbDF8SDcGT4TToQ/yXY8XA9UrBvsD8bU1llACPtWwmYx7
         sF+Q5MAZZ/uQZ2WTp0lqeFCe0PzCjsdENIPwgK0r8zq5dnxHntO5GGIzXTBThco0F4dY
         jTPg==
X-Forwarded-Encrypted: i=1; AJvYcCVqh1zMr+Y/oLez/4F1sDWPd5S05xZIMw3/doD5G2WTbt5JyKW3FO/EuKvIHAyEvAF0d5sT8gD1N4nxKlYeZUC2BrEk@vger.kernel.org
X-Gm-Message-State: AOJu0YxMdxU4eNpe/vRS++HS4zRlLd6CWN/74X09bXV0ioh1EIv1LpHT
	uQwLIQWmv54lo3mpJquAeVx4QtvdBM8cVdECZ0llytakldEf0gpJg0rB
X-Gm-Gg: ATEYQzzruyW86yjbgGSpxogTc86xUUeD6MKMeY6ZIB0S3PQ2CRiIWLC1nCX0m+ECQJR
	aV6BtezlCsv6fYubVNwF+uDbxgEIU8SbWLpxksRDB7esDvQQoluzfdbeBwVD0S4kUOXcWeqV4S0
	Vw3trN+jxY/ZOraKF4DkrB1D9a2BxldAb0nXWQXJQhIxEJcZsl5AT2gUkp8M3SEmU3AGlAGWbvw
	JzAOJsfVxTWOSf0UCQDXurVGCqO3JwSnV2tiLaRjybPfWceQKKGFXlT/YQjiA6/l/PdC6wSkcGZ
	2efcprJUK0HfPUGSnRSv6D+K/HlgODQeub2gM80fFAtYlTSwBFJBRc4w8AwfvOIuKSELbIlcYFX
	EiM1vE5L/qUwStmtJ1hrO14xEEd16Novz2c73OMemTNDDALAsqdrCVGxNvi1sAQ/K8T0k53825s
	Ux9+t5iqaDyKdSdYmEiEbSVcyCrKeoJazzD8HG2WaX3xOaqj9ApLqCsx23Lfyu/fON
X-Received: by 2002:a05:7300:bc85:b0:2be:1a8e:10bb with SMTP id 5a478bee46e88-2c14b5271damr517863eec.12.1774305779340;
        Mon, 23 Mar 2026 15:42:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm18575186eec.9.2026.03.23.15.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:42:58 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:42:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Peter Tyser <ptyser@xes-inc.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: meraki-mx100: use real software node
 references
Message-ID: <acHBpaEIfS71oryo@google.com>
References: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com>
 <202603201641.qJ8m8Nhn-lkp@intel.com>
 <CAMRc=MfWsChQc-xHiBtL6HKv6ax36szfEE8Ckjf7VUfhxzG9OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfWsChQc-xHiBtL6HKv6ax36szfEE8Ckjf7VUfhxzG9OA@mail.gmail.com>

On Mon, Mar 23, 2026 at 10:39:30AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 20, 2026 at 9:18 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Bartosz,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/platform-x86-meraki-mx100-use-real-software-node-references/20260316-165120
> > base:   b84a0ebe421ca56995ff78b66307667b62b3a900
> > patch link:    https://lore.kernel.org/r/20260316-meraki-swnodes-v3-1-15501a52300e%40oss.qualcomm.com
> > patch subject: [PATCH v3] platform/x86: meraki-mx100: use real software node references
> > config: x86_64-buildonly-randconfig-001-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603201641.qJ8m8Nhn-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    ld: vmlinux.o: in function `lkdtm_rodata_do_nothing':
> > >> (.rodata+0xa9b6c0): undefined reference to `lpc_ich_gpio_swnode'
> > >> ld: (.rodata+0xa9b840): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: (.rodata+0xa9b960): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: (.rodata+0xa9ba80): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: (.rodata+0xa9bba0): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: vmlinux.o:(.rodata+0xa9bcc0): more undefined references to `lpc_ich_gpio_swnode' follow
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> FYI this is a false-positive - the prerequisite patch is already in Lee's tree.

It is not: you did not define a dependency on LPC_ICH, so in the 0-day
.config it is not enabled.

This is what I mean by tight coupling.

Thanks.

-- 
Dmitry
