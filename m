From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] asus-nb-wmi: Add wapf4 quirk for X200MA
Date: Tue, 30 Jun 2015 10:53:30 -0700
Message-ID: <20150630175330.GC61463@vmdeb7>
References: <1435592113-14372-1-git-send-email-hanipouspilot@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435592113-14372-1-git-send-email-hanipouspilot@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Dmitry Tunin <hanipouspilot@gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 29, 2015 at 06:35:13PM +0300, Dmitry Tunin wrote:
> Wireless is not blocked without this quirk, but
> wireless LED does not follow wireless status.
> With this quirk it accurately reflects if wireless is on or off.
> 
> Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
> Acked-by: Corentin Chary <corentin.chary@gmail.com>
> Cc: stable@vger.kernel.org

Thanks Dmitry, queued to testing.

In the future, please use the maintainer email address listed in the MAINTAINERS
file as a general rule for submitting patches.

-- 
Darren Hart
Intel Open Source Technology Center
