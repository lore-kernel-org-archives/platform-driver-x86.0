Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721F40756F;
	Thu,  7 May 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164934; cv=none; b=K4WZvIFybEwEZ8GW16coC4dvzwW2FLwOTBHaC/4UR2tUcTilpYRFGJN+q47gJW2zAb/dwyyIKrxkLSHAdhQbjX/tYWQ7tD0DbfnZmm3S+F0u7BAR//9NsLgNeBV8zMAsRmlcpJf5aD6wt1mQfY+ahrFkaL4O+V3LS4sx7xktE9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164934; c=relaxed/simple;
	bh=Hpz6DdswZV8mvTLg9SeRGWwV22mJBT8E/H2f/2UkSSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jX2TI5yr4lJsCMQqr0kg1BDWxBOD2Mkw8k8mXT6Xw9fLG0Y4UGDDAC8k5dre173NzAtHNQ81Cy9CWvquCCwBpmA7KUe4OxgjGzOBNnJp15Vgi81imLi7i+m//6DPU27qDxRbxUI0k7JoVXM1wexXXjL/HnL2VYNNV6gSaKilSks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FpFOJT0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FpFOJT0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB72C2BCF6;
	Thu,  7 May 2026 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778164934;
	bh=Hpz6DdswZV8mvTLg9SeRGWwV22mJBT8E/H2f/2UkSSk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FpFOJT0HAlro07Y51LjCkkS1rvaX4YBseGwFUFZZ4d4DXVQSKALI+/MCstepJz3Zf
	 StTmAWIdF0diQUX9F6TYu59CBmJo67VjRVPX2MOqjJ2zCs5iSqrZDOXlsW1wYuuvQ+
	 avwDIHE7+diG/hCIWWAi/SJKrdbBIHPwpJmuvrjB9v6N1hN756cUgC5pxxkIR+Li6N
	 FB6B25a2q4EMC3ctzRXXOPaNvpo+o5q0K+OLvPSY2SHBtjO4EHvCbr0ZxhLdweX5s+
	 xb5+zzvJkEp9aTlknV3yZNIwZfSWxJonw4HguA7Q3VX6z+YNhFWZuLxFwflDlygqf9
	 TxqB4yKEecBDA==
Message-ID: <3af8e050-9934-45ca-8e5e-1e6a69909637@kernel.org>
Date: Thu, 7 May 2026 16:42:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/x86: asus-tf103c-dock: Move long delayed
 work on system_dfl_long_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
References: <20260507143953.342654-1-marco.crivellari@suse.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260507143953.342654-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7-May-26 16:39, Marco Crivellari wrote:
> Currently the code enqueue work items using {queue|mod}_delayed_work(),
> using system_long_wq. This workqueue should be used when long works are
> expected and it is a per-cpu workqueue.
> 
> The function(s) end up calling __queue_delayed_work(), which set a global
> timer that could fire anywhere, enqueuing the work where the timer fired.
> 
> Unbound works could benefit from scheduler task placement, to optimize
> performance and power consumption. Long work shouldn't stick to a single
> CPU.
> 
> Recently, a new unbound workqueue specific for long running work has
> been added:
> 
>     c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")
> 
> Since the workqueue work doesn't rely on per-cpu variables, there is no
> obvious reason that justify the use of a per-cpu workqueue. So change
> system_long_wq with system_dfl_long_wq so that the work may benefit from
> scheduler task placement.
> 
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/platform/x86/asus-tf103c-dock.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
> index f09a3fc6524a..de683e17ce01 100644
> --- a/drivers/platform/x86/asus-tf103c-dock.c
> +++ b/drivers/platform/x86/asus-tf103c-dock.c
> @@ -669,7 +669,8 @@ static irqreturn_t tf103c_dock_hpd_irq(int irq, void *data)
>  {
>  	struct tf103c_dock_data *dock = data;
>  
> -	mod_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD_DEBOUNCE);
> +	mod_delayed_work(system_dfl_long_wq, &dock->hpd_work,
> +			 TF103C_DOCK_HPD_DEBOUNCE);
>  	return IRQ_HANDLED;
>  }
>  
> @@ -677,7 +678,8 @@ static void tf103c_dock_start_hpd(struct tf103c_dock_data *dock)
>  {
>  	enable_irq(dock->hpd_irq);
>  	/* Sync current HPD status */
> -	queue_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD_DEBOUNCE);
> +	queue_delayed_work(system_dfl_long_wq, &dock->hpd_work,
> +			   TF103C_DOCK_HPD_DEBOUNCE);
>  }
>  
>  static void tf103c_dock_stop_hpd(struct tf103c_dock_data *dock)

