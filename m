Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACEB37F8CC;
	Sun, 19 Jul 2026 23:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784502499; cv=none; b=j4e98a6uWkiXNhQauj2GgEddgOESiiHUUdKoL3yQodJcdGsumJ1lR2DIVN1hj1/2zsT+eY85dHJZazopw2+CdpSfhg/3fl5iZzcb7IfujB0PUdjC8zv8V3gSgfNyPVYmB+XFYsEZ0xDM9ksicFubYCaHfuNeKo0w2eHUZO4CGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784502499; c=relaxed/simple;
	bh=EgylTw5NtIWHwvNrWlvQ/LqiatKrymyNwPWTqf97PbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khtFuwGuNQGnrOF0lynXx33wM5e1qwFE4Owy4IYdx0iHpCfmBjdRWYcQ7QfE3fSkaNV9Mf/aTb6D0pqjY32dEH7jUsCWrEhE8cW/AQ7K84nbpgER/wqUGdq4/+2HYtkDVhMumdH8cnaei5thrrIsTlhAxDTrJFtBQvn2+w4letc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZxmllpa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZxmllpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77DA1F00A3D;
	Sun, 19 Jul 2026 23:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502497;
	bh=K7NbXJhwT8cHjJAvRs9KohMqKpOUiXmG9r+4uV2sG9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UZxmllpaRjoY7Ip+XRv0P2qsFYSXZPZXKdMT158b3st9dlVPCOhGXNQBOCKBp8NjX
	 6Qe9MfkJZq+Vp35lcdaiDb9PqTPFsah4/j5FCQ9puy4z13V/kkDdI6dFF8iB371rFt
	 dyNtM++LopNSjUfx21NNF7oTjFAtn/TRWULO2L1mmOnDqcL2RYoG217PqIYzB2BOlW
	 K15JDBvkq0r3adaQgN2oTslZTIh5ifXvHWNB1gbKSWXC8U4eE3+7Ev6I0v4SLERIfw
	 AGjNXQ2rCITFMgrmJQHTo8yrz1AgKNw/svwbanWzJY/zh57snvoZpjFlfk5bh7ONUY
	 90iobzmeZEwCw==
From: Danilo Krummrich <dakr@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	brgl@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v8 0/5] driver core: unify the release path for dynamically allocated platform devices
Date: Mon, 20 Jul 2026 01:08:11 +0200
Message-ID: <20260719230811.812546-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 16 Jul 2026 14:31:35 +0200, Bartosz Golaszewski wrote:
> [PATCH v8 0/5] driver core: unify the release path for dynamically allocated platform devices

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/5] driver core: platform: amend the API contract for fwnode setters
      commit: e6054f410c97
[2/5] platform/surface: gpe: use platform_device_register_full()
      commit: 1e0bd438b876
[3/5] drm/xe/i2c: use device_create_managed_software_node()
      commit: 0f485f88656a
[4/5] driver core: platform: unify release path
      commit: 7d80509ff0da
[5/5] driver core: platform: tests: add test cases for correct swnode removal
      commit: 397f0a3958c9

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
