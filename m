From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 0/5] dell fixes and Skylake updates
Date: Tue, 16 Feb 2016 23:00:56 -0800
Message-ID: <20160217070056.GD20116@dvhart-mobl5.amr.corp.intel.com>
References: <cover.1455553470.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48069 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756583AbcBQHA4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 02:00:56 -0500
Content-Disposition: inline
In-Reply-To: <cover.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

On Mon, Feb 15, 2016 at 08:32:32AM -0800, Andy Lutomirski wrote:
> This is the successor to v3 of the dmi walk fixes and v4 of the Skylake
> stuff.  The Skylake history is in that patch's notes.

Only mostly minor comments from me and one from Pali. I've pushed this to a
dell-skylake topic branch to let 0-day beat on it for a day. Please have a look
at my review and Pali's and send any necessary updates.

Thanks Andy, appreciate your patience and time on this series.

-- 
Darren Hart
Intel Open Source Technology Center
