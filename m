From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Add a module parameter to disable hotkeys
 registration
Date: Sun, 7 Feb 2016 12:33:02 -0800
Message-ID: <20160207203302.GJ1779@malice.jf.intel.com>
References: <1453751538-18993-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453751538-18993-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 25, 2016 at 12:52:18PM -0700, Azael Avalos wrote:
> Some laptop models have working hotkeys without the need of the driver
> to activate them.
> 
> This patch adds a module parameter to tell the driver not to register
> the hotkeys.
> 
> The new parameter is useful in DE less installations or where the DE
> does not handle the hotkeys (see bug 99501).
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Merged to testing. Thanks.

-- 
Darren Hart
Intel Open Source Technology Center
