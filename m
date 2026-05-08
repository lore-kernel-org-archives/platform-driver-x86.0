Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38673E3D83;
	Fri,  8 May 2026 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247260; cv=none; b=XW/wDYFkEM/3uoLkjQaaYjFwu+C1/xuqGFa2o7K2e2y1PrUTISMo2ceSzGj5RTt/6sj72h/Sc26NvYeDlXCyC5ZfVP5JNekpP1lpRmxh7glmRU8gB+8ITXK1U9KeW3Ju0qQCpAXOqDEkTdNjvVnTKdD9nWXtKa0I1jfafA/QmEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247260; c=relaxed/simple;
	bh=RPb69BZPZuaXLBx9yCkv6HWTC762odVELtgxJ7EJYyo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aVr24T0uXSbPCfXPG++UJMr0p26nDKesc8114X4hB9sNj9J7pIqpOkV2idaPC7gFC+pxlIX/JJxU+N/uZ0h8VDXPaKD3I3U4nNXRy8eD44X+5kNotzdaATadi54o00kKyojMSXb+GocHuyoZD3FwbVn1R08UxI8QszvbaV+9x3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1CfC5rV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1CfC5rV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778247258; x=1809783258;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=RPb69BZPZuaXLBx9yCkv6HWTC762odVELtgxJ7EJYyo=;
  b=n1CfC5rVt8Jg3ubZpbUK0GRF+qEZj8M0MYYYuSYyeLSgZLRXMckXQ7Bj
   pWFiiUfFGO50b1zwlZfHf6plYw03dzBqi2gp4mzjzZi327x30KZ/LRXNg
   kLNk9n6UKpuEREJoYeRANzErfYspRZtuEBt6/QQxucSelnwS2NANXZJKD
   NT0vm/cC0/U1WR/RDtdZtUXDBnirRV2cH8hlfaJFVh33qlkERDqh+QMZ3
   H5QqE/XD//2hmsyzWN2g5fNXfEM2CSzpCX2f59pimgMIZNs2Ugga8RssV
   C1uN3xn24d+/bzVkjOULvE188/+SDQjCXMQGwrBS5Qk/0P7NBLRsooTuz
   Q==;
X-CSE-ConnectionGUID: smxLtWy0Qm6oHjfmYO4FLg==
X-CSE-MsgGUID: qsFIJkZrTjuLOlJK8BIaZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89803154"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89803154"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 06:34:16 -0700
X-CSE-ConnectionGUID: GdN2oRC7SpqJofVdbGoMsQ==
X-CSE-MsgGUID: dSLVcHr8SyisLiKLnqDKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="240759456"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 06:34:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 8 May 2026 16:34:08 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>
cc: Marco Crivellari <marco.crivellari@suse.com>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Michal Hocko <mhocko@suse.com>, Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>
Subject: Re: [RFC PATCH] platform/x86: asus-tf103c-dock: Move long delayed
 work on system_dfl_long_wq
In-Reply-To: <3af8e050-9934-45ca-8e5e-1e6a69909637@kernel.org>
Message-ID: <6200c16b-74f9-9942-50f7-fc8dc04d2264@linux.intel.com>
References: <20260507143953.342654-1-marco.crivellari@suse.com> <3af8e050-9934-45ca-8e5e-1e6a69909637@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-214943133-1778247172=:1002"
Content-ID: <721c66bb-cb3c-552d-3d16-99b10f32f35f@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-214943133-1778247172=:1002
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <29efece9-3c0e-4d0d-aeea-7d5ec58c8537@linux.intel.com>

On Thu, 7 May 2026, Hans de Goede wrote:

> Hi,
>=20
> On 7-May-26 16:39, Marco Crivellari wrote:
> > Currently the code enqueue work items using {queue|mod}_delayed_work(),
> > using system_long_wq. This workqueue should be used when long works are
> > expected and it is a per-cpu workqueue.
> >=20
> > The function(s) end up calling __queue_delayed_work(), which set a glob=
al
> > timer that could fire anywhere, enqueuing the work where the timer fire=
d.
> >=20
> > Unbound works could benefit from scheduler task placement, to optimize
> > performance and power consumption. Long work shouldn't stick to a singl=
e
> > CPU.
> >=20
> > Recently, a new unbound workqueue specific for long running work has
> > been added:
> >=20
> > =A0=A0=A0=A0c116737e972e ("workqueue: Add system_dfl_long_wq for long u=
nbound works")
> >=20
> > Since the workqueue work doesn't rely on per-cpu variables, there is no
> > obvious reason that justify the use of a per-cpu workqueue. So change
> > system_long_wq with system_dfl_long_wq so that the work may benefit fro=
m
> > scheduler task placement.
> >=20
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
>=20
> Thanks, patch looks good to me:
>=20
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
> > ---
> >  drivers/platform/x86/asus-tf103c-dock.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform=
/x86/asus-tf103c-dock.c
> > index f09a3fc6524a..de683e17ce01 100644
> > --- a/drivers/platform/x86/asus-tf103c-dock.c
> > +++ b/drivers/platform/x86/asus-tf103c-dock.c
> > @@ -669,7 +669,8 @@ static irqreturn_t tf103c_dock_hpd_irq(int irq, voi=
d *data)
> >  {
> >  =09struct tf103c_dock_data *dock =3D data;
> > =20
> > -=09mod_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD_D=
EBOUNCE);
> > +=09mod_delayed_work(system_dfl_long_wq, &dock->hpd_work,
> > +=09=09=09 TF103C_DOCK_HPD_DEBOUNCE);
> >  =09return IRQ_HANDLED;
> >  }
> > =20
> > @@ -677,7 +678,8 @@ static void tf103c_dock_start_hpd(struct tf103c_doc=
k_data *dock)
> >  {
> >  =09enable_irq(dock->hpd_irq);
> >  =09/* Sync current HPD status */
> > -=09queue_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD=
_DEBOUNCE);
> > +=09queue_delayed_work(system_dfl_long_wq, &dock->hpd_work,
> > +=09=09=09   TF103C_DOCK_HPD_DEBOUNCE);
> >  }
> > =20
> >  static void tf103c_dock_stop_hpd(struct tf103c_dock_data *dock)
>=20

Hi Marco,

Is there some particular reason why this was sent as RFC?

--=20
 i.
--8323328-214943133-1778247172=:1002--
