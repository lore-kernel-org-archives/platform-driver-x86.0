Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7Vj8m/+"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75303121;
	Thu, 14 Dec 2023 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702565580; x=1734101580;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QRBijjpKPX/0k4bPHMSixNO9tz91uvdYIU2U6m4CqUQ=;
  b=L7Vj8m/+XH2aKcGdG5LWvVPMQXnYCpDzhJTkrR2e9zBO0nySNM6bPeMf
   zrDLdTWGc8qqXFBNfQEasFapnVt7X674pa32j8MQpE/NIc83Nlhjn9HyR
   zCq86Nd4l6GihxrOLMHEmJPY0QEwd08hIEjl6mCXyeGhXFwaIs94VL69W
   Uz5jiqAq/j462C4aXjqzPlXsXRieS1Vbimm2VG76/qH9c37OWgdIa06E9
   SNkLywawdkUzuPciau1uYScg9mT9k+dhrGXRkuysZzs/wGVvvG65MxNh7
   b4CjcknYRvMwEe4u2xQ0chLMBds6ULAlRrAryKJLUmPelbGdwJY1x/BD0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375284126"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="375284126"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750553973"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="750553973"
Received: from malunat-mobl2.ger.corp.intel.com ([10.252.48.195])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:52:57 -0800
Date: Thu, 14 Dec 2023 16:52:51 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    markgross@kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: fix for incorrect fan
 reporting on some ThinkPad systems
In-Reply-To: <20231214134702.166464-1-vishnuocv@gmail.com>
Message-ID: <702d46c3-f4a1-142e-c8a3-1e462934f9ea@linux.intel.com>
References: <20231214134702.166464-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-322919863-1702565579=:1586"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-322919863-1702565579=:1586
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Thu, 14 Dec 2023, Vishnu Sankar wrote:

> Some ThinkPad systems ECFW use non-standard addresses for fan control
> and reporting. This patch adds support for such ECFW so that it can report
> the correct fan values.
> Tested on Thinkpads L13 Yoga Gen 2 and X13 Yoga Gen 2.
> 
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
> -Improvements to comments as requested.
> -Removed the usage of unlikely/likely while reading fan speed.
> -Improved and clearer print statements to match the current style.
> -Changed seq_puts to seq_printf of an unrelated section of the patch.
> -Improved the readability of the code.
> -Added more clearer comments.

Nice work, thanks.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-322919863-1702565579=:1586--
