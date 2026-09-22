Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE379544D7A
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086034; cv=none; b=nNwnFu6+/EmzU36uasdHx9w2B9ROVANhG/6+1elD4u874u9D1U6PpTaDhyUqdxxCX2nB4SaPSQdBLK2rOO7h47PsizLZC5R3pfbdE+4YMt9T+rwUuoI/CTyS+EoaDryt5kn/WAj4WRkkGxfgY8BFTHrt5zy42PVR+eqCj2sih0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086034; c=relaxed/simple;
	bh=4Uas26dGhU/iXyr6v6wOQY88unFWnTVcU29K2xYHVc0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdAPA7ftogKqamuqjmvqdgCIFKIiDfFHhQYdEEDeLS28d73lt88Ks2KEUltqJLptrF+IUmkHeru9pqeS8nz10ukz5xhXQlafHw6fur1gHV133jvH+ooi30nmXKAtYF4JwQEvVmAJqkUFQzevcasHkNcxNgSBlASqT7y5mjKI8I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxP/vKDS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxP/vKDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8191F0089C
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086033;
	bh=kUHXPatxl6UDjnbGBaoNIDKARQ2zRd+ziWNoZ41+0RM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lxP/vKDSiXT2QGOjMIwkk3x+yEAYCg2kJyuUM6sWk61hBHI9ZWFXn5G0ON/R2yVT+
	 zwONGAOeAX3B9UVA+3REtPbCJk5Cji0J7nkUkiVMR+dn2FJYQeE5Z4o6D84gtjpApt
	 0diQvRJaXTedqcS6LHpxvIn6TTeUaEDLIouEH5yDggoLepDNpU6vVIfJldSz5GUJWF
	 2YjVFU5CmczjIuIfGBYRmQ7Q8lhEjd016Ly8lUq310AKO3n9Z3lqNqwehCuaelMF15
	 oXcewccnVgfCntfsVJzTBQrEWqHq7JiPBCK2Ds1AGkOaVGHH9QTKH/C6CJq/r8K3lm
	 mrEwwIyjTUNhA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so3987734e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 07:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWkCXRKqdRWni+JYaFEVa+RFoPk+0FA/5maoJxl1b/kAeAv1z2yiJKcEBexfGj+b0jCl4H6l2zvFfEdOf3k+H70BD2@vger.kernel.org
X-Gm-Message-State: AFuF++kfwmUJEKV1ikEFIbIkc8huftZIXV/f/jG1iei7oqnpiAWPNJCb
	/RYtY05U/I2EoXBKq1jkRGAN6jWxkuaF1cCCMwsCn08Si3SNxJDCyWgaah39TswVXDauoMRkugF
	phJa914sHgt1CCYEfE2MVE3dUBAy4Wluu+cYX7ISfuw==
X-Received: by 2002:a05:6512:3c89:b0:5b8:bc5e:b584 with SMTP id
 2adb3069b0e04-5b8c195dba5mr4212786e87.60.1790086032032; Tue, 22 Sep 2026
 07:07:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 07:07:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 07:07:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <arJY1TMBIZCy8E7n@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
 <20260716-swnode-remove-on-dev-unreg-v8-3-5c2b8cc38c28@oss.qualcomm.com> <arJY1TMBIZCy8E7n@black.igk.intel.com>
Date: Tue, 22 Sep 2026 07:07:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfKw=r_Rq5jLqRQ9PsfiWoQ9y9EJFkpdWraLsPoK3m52w@mail.gmail.com>
X-Gm-Features: AcwNN1UEx80-dq3niB3Ch-hprwiz9M1bLoeYBSF0qAEN-wKYR-Jy-u3bvPVw6Es
Message-ID: <CAMRc=MfKw=r_Rq5jLqRQ9PsfiWoQ9y9EJFkpdWraLsPoK3m52w@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] drm/xe/i2c: use device_create_managed_software_node()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, brgl@kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sep 2026 12:30:45 +0200, Heikki Krogerus
<heikki.krogerus@linux.intel.com> said:
> On Thu, Jul 16, 2026 at 02:31:38PM +0200, Bartosz Golaszewski wrote:
>> This driver intentionally uses the fine-grained approach to creating
>> platform devices. It assigns a software node as the primary firmware
>> node of the device it creates. Ahead of improving the reference counting
>> of platform device software nodes, switch to using
>> device_create_managed_software_node(). This way, we create a dynamic
>> software node whose life-time is tied to the device to which it's
>> assigned.
>>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>
> What happened to this one? I can see the commit 0f485f88656a
> ("drm/xe/i2c: use device_create_managed_software_node()"), but not the
> code change?
>
> There is no revert and there are no other commits touching this part
> of the driver, so it's as if the patch was never actually applied?
>

I had no idea what happened here so I had the robot look into it and it cam=
e
back with this:

--
Your commit 0f485f88656a ("drm/xe/i2c: use
device_create_managed_software_node()") landed upstream on 2026-07-16, but =
it
went in through the driver-core tree (it's signed off by Danilo Krummrich,
a driver-core maintainer), not through drm-xe. It reached mainline via the
"Merge tag 'driver-core-7.3-rc1'" pull, and was present in v7.3-rc1.

Meanwhile, Intel's drm-xe-next tree had last synced with mainline back on
2026-08-06 (merge-base ec3e9419371d, before your commit existed). Off that
stale base, Heikki Krogerus landed a large I2C IRQ-handling rewrite on
2026-08-11 (a55b76b8bc2c "Fix the interrupt handling", 76cc14e2faed "Keep
the i2c controller always enabled") that touched
xe_i2c_register_adapter()/xe_i2c_unregister_adapter() =E2=80=94 the same fu=
nction
your patch changed =E2=80=94 but built on the pre-conversion
fwnode_create_software_node() code, since drm-xe-next didn't have your comm=
it
yet.

The regression happened here:

cc467969646b =E2=80=94 "Merge drm/drm-next into drm-xe-next" by Matthew Bro=
st
(Intel), 2026-08-31, merging:
- parent 1: drm-xe-next's tip (Heikki's rewrite, on the old fwnode code)
- parent 2: v7.3-rc1 (mainline, with your new
  device_create_managed_software_node() code)

I diffed the merge result against both parents directly: for the
xe_i2c_register_adapter/unregister_adapter hunk, the merge commit is
byte-for-byte identical to parent 1 =E2=80=94 it silently dropped your API-=
migration
change and kept the old fwnode code (plus Heikki's IRQ rework on top of it)=
.
No Conflicts: trailer is in the merge message, so this wasn't a manual
conflict resolution that anyone flagged =E2=80=94 either it merged cleanly =
in a way
that just discarded your side, or it was resolved without git noting it in
the message.

That merge (drm-xe-next-2026-08-31-1) then flowed drm-xe-next =E2=86=92 drm=
-next
=E2=86=92 mainline, and it's still that way in current mainline (verified: =
HEAD,
v7.3-rc4-based, still has the old code =E2=80=94 confirmed via git blame).

Bottom line: your change wasn't reverted on purpose =E2=80=94 it was silent=
ly clobbered
by a stale-base merge conflict resolution when drm-xe-next resynced with
mainline on 2026-08-31, because drm-xe-next hadn't picked up your
driver-core-authored commit before building new code on top of the same
function. This is a real upstream bug worth flagging (to Matthew Brost
/ Heikki Krogerus / Danilo Krummrich): the driver-core migration for xe_i2c=
.c
needs to be reapplied on current mainline.
--

I think we need to reapply this patch.

Bart
