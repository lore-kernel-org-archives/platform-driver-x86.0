Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F193EA94B;
	Thu,  9 Jul 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588560; cv=none; b=p3z1PbR/uXhQl8iXHIuTtl5kbqAOb5uOLie18WXT8oiy9nsTV9reT/MncTj7+H95zTNowuRDDa7uGViThUQ1TcNldh1dhm5+xfBo9sOQawNWiDs8sL0woLyWOeGYuiiJ930/rDAksc1qQWumA50Hn+yd0SoRUrVgUL2+jnTRY/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588560; c=relaxed/simple;
	bh=zymIG4DMppBgxLRVBQz+Ao8C/YrEOU6mr6XrUxC0nNc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qm6mCIinRrD+++63mCcIHWCcmZ7ZJRZtp5gBmSmYNDBUmZp6feiI17k4zIffynU7cd4YSAps8cQ4NHulwuHN9HMi9hRaJNCele1/IONIl6ucWDug0rbRywiHhOiVTvxBMcYx9KmxkcsWRYhvhSMwLLBU/AIs1ORX5jtTaRgmGNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kg0cFmzV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kg0cFmzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783588557; x=1815124557;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zymIG4DMppBgxLRVBQz+Ao8C/YrEOU6mr6XrUxC0nNc=;
  b=Kg0cFmzVl06eaAWKacT8440DCvwYqH/sg+Bf5UpezcakmaYmX4O0gRFD
   g4fqLaaNzbOPCXj37bjMoXdiyhw72Ywq2Kbd/vsPkvqxHCi44+g69m3mD
   agEPrGXx2Yi8dgGvjC+qE6T7RxuNbCons3tf5XbmYT2qcLEJ5fLksJ6tV
   5tayeU5ppUq50+6nWqTeMugjR2q3M3mtU/NgmVYTmZ05wgBW5nlnupm42
   mJPELqAs7ASYNxfFi57/s+0rmWFTH7RUAadK+dusgF/TQEq1i2MOvXzvl
   03raa+oJ4r3waYUcUTrtOVryY9aYgRCPuwjtqOFEYrTW7VxrE7Tq7M+X0
   g==;
X-CSE-ConnectionGUID: NEHCMamgQues09fWMCXYLQ==
X-CSE-MsgGUID: t0YxrlByRuWBQO/FTosXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107060668"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107060668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 02:15:55 -0700
X-CSE-ConnectionGUID: CZiak7ksRjerPxZMvVEdrA==
X-CSE-MsgGUID: vCjLcJpDRZuVt/Apfdz5rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253435836"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 02:15:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 12:15:50 +0300 (EEST)
To: "M K, Muralidhara" <muralimk@amd.com>
cc: Muralidhara M K <muralidhara.mk@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/6] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
In-Reply-To: <844fc5bb-5e0b-4380-b73d-56ff235fea28@amd.com>
Message-ID: <9c22710c-f46c-7127-6091-63cc118e69ac@linux.intel.com>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com> <c0ff9acc-5a29-1556-dc35-3df205bcf9ec@linux.intel.com> <844fc5bb-5e0b-4380-b73d-56ff235fea28@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-231033506-1783588550=:1261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-231033506-1783588550=:1261
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Jul 2026, M K, Muralidhara wrote:
> On 7/8/2026 3:37 PM, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 8 Jul 2026, Muralidhara M K wrote:
> >=20
> > > This series makes the AMD HSMP driver safe against concurrent probe/r=
emove
> > > of its per-socket devices and against the lock-free data plane (open
> > > /dev/hsmp fds and hwmon/sysfs reads) racing socket teardown.
> > >=20
> > > The ACPI front-end binds one platform device per socket but shares a
> > > single
> > > socket array and a single /dev/hsmp misc device across them, while th=
e
> > > data
> > > plane issues mailbox messages with no coordination with driver teardo=
wn.
> > > misc_deregister() does not drain already-open fds, so an in-flight me=
ssage
> > > can touch a freed socket array or an unmapped mailbox on unbind.
> > >=20
> > > The fix is built up in small, bisectable steps:
> > >=20
> > >   1. Serialize the ACPI probe/remove handshake with a dedicated mutex=
=2E
> > >   2. Map the metric table with ioremap() and release it via a devres
> > > action,
> > >      so its lifetime is no longer pinned to a single per-socket devre=
s
> > > scope.
> > >   3. Serialize the per-socket metric-table fill-and-copy with a mutex=
=2E
> > >   4. Clear mdev.this_device on deregister (independent hygiene fix th=
at
> > > the
> > >      next patch relies on to track /dev/hsmp registration).
> > >   5. Track shared socket ownership with a refcount and a single
> > > coordinated
> > >      release helper, drop the is_probed flag and unparent /dev/hsmp.
> > >   6. Add hsmp_sock_rwsem: the data plane holds it for read, a teardow=
n
> > > path
> > >      holds it for write to drain in-flight messages before freeing th=
e
> > > socket
> > >      array or unmapping the mailbox.
> > >=20
> > > Each patch builds on its own and the series is checkpatch --strict cl=
ean.
> > >=20
> > > Changes since v3:
> > >   - Use guard()/scoped locking consistently for both the probe mutex =
and
> > > the
> > >     data-plane rwsem, from the first patch that introduces each lock.
> > >   - Platform teardown now uses devm_add_action_or_reset(): the
> > > metric-table
> > >     unmap and the per-socket mutex destroy run from a single devres a=
ction
> > >     instead of explicit remove()/probe-failure code. The ACPI array i=
s
> > > shared
> > >     across per-socket devices and must outlive an individual unbind, =
so it
> > >     stays on explicit teardown.
> > >   - Split the mdev.this_device clear into its own patch (new patch 4)=
=2E
> > >   - Drop dead defensive checks: the !sock guard in
> > > hsmp_unmap_metric_tbls()
> > >     and the if (sock) in hsmp_acpi_remove(). Keep and document the on=
e in
> > > the
> > >     probe-failure path, where sock can legitimately be NULL.
> > >   - Replace the !--refs construct with a plain decrement-then-test.
> > >   - Explain why the probe path uses a separate mutex rather than the =
rwsem
> > >     write side: the probe path itself drives the data plane via
> > > hsmp_test(),
> > >     which takes the rwsem for read, so holding it for write across pr=
obe
> > >     would deadlock.
> >=20
> > Hi,
> >=20
> > Could we have xx_locked() variant function for hsmp_test() to use so th=
e
> > recursive locking problem is avoided?
> >=20
> Yes, that works and let me drop hsmp_acpi_probe_mutex entirely and serial=
ize
> the ACPI control plane on hsmp_sock_rwsem alone.
>=20
> One clarification I am thinking of is: the recursion isn't only through
> hsmp_test(). init_acpi()/init_platform_device() also reach the data plane=
 via
> hsmp_cache_proto_ver(), hsmp_get_tbl_dram_base() and the hwmon setup, all
> through hsmp_send_message(). So rather than a one-off hsmp_test_locked(),=
 I'll
> split hsmp_send_message() into a hsmp_send_message_locked() core
> (bounds/nospec/dev check + per-socket semaphore + MMIO, no rwsem) and a t=
hin
> hsmp_send_message() wrapper that takes the rwsem for read.

Yes, if that's the case.

> The probe-only
> senders call the _locked core, the probe path takes the rwsem for write, =
and
> hsmp_acpi_probe_mutex goes away.
>=20
> The one behavioral change is the probe then holds the rwsem for write acr=
oss
> the whole mailbox handshake (a few messages, up to HSMP_MSG_TIMEOUT each)=
, so
> the data plane on already-probed sockets is blocked for that window. Prob=
e is
> a boot/rare-rebind event so I think that's fine.

Yes, I think it's okay to reuse an existing rwsem for probe/remove. It=20
just keeps things much simpler.

I'm actually expecting it to save us some trouble in future over separate=
=20
locks exactly because we can now know the other sockets cannot race with=20
the probe.

> I'll add
> lockdep_assert_held_write() in the locked core to keep the "rwsem already
> held" contract explicit.

Good.
=20
> or Let me know your inputs ?
>=20
> > >   - Comment cleanups: drop history and "patch N" references, drop
> > >     parenthetical function asides, single space after periods.
> > >=20
> > > Muralidhara M K (6):
> > >    platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
> > >      mutex
> > >    platform/x86/amd/hsmp: Map the metric table with ioremap() and unm=
ap
> > >      it explicitly
> > >    platform/x86/amd/hsmp: Serialize per-socket metric table reads wit=
h a
> > >      mutex
> > >    platform/x86/amd/hsmp: Clear mdev.this_device on deregister
> > >    platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinate=
d
> > >      release
> > >    platform/x86/amd/hsmp: Serialize the data plane against socket
> > >      teardown
> > >=20
> > >   drivers/platform/x86/amd/hsmp/acpi.c | 135 ++++++++++++++++++++++++=
---
> > >   drivers/platform/x86/amd/hsmp/hsmp.c | 107 ++++++++++++++++++++-
> > >   drivers/platform/x86/amd/hsmp/hsmp.h |  15 ++-
> > >   drivers/platform/x86/amd/hsmp/plat.c |  26 ++++++
> > >   4 files changed, 265 insertions(+), 18 deletions(-)
> > >=20
> > >=20
> > > base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
> > >=20
> >=20
> > --
> >   i.
> >=20
>=20

--=20
 i.

--8323328-231033506-1783588550=:1261--
