From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/3] toshiba_acpi: Fix USB Sleep & Charge mode and
 documentation updates
Date: Tue, 7 Apr 2015 20:50:38 -0700
Message-ID: <20150408035038.GA14618@fury.dvhart.com>
References: <1428024381-3823-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428024381-3823-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 02, 2015 at 07:26:19PM -0600, Azael Avalos wrote:
> This patch fixes the USB Sleep & Charge charging mode on certain
> models, fixes pr_* messages and also adds the missing entries in the
> documentation file.
> 
> Changes since v2:
> - Check for TOS_SUCCESS to initialize and flag as supported on first
>   patch
> 
> Changes since v1:
> - Set the default supported value of sleep and charge to zero in case
>   of an error and added comments.
> - Updated the title and commit message of second patch to better
>   reflect what the patch is doing.
> 
> Azael Avalos (3):
>   toshiba_acpi: Update and fix USB Sleep and Charge modes
>   toshiba_acpi: Fix pr_* messages from USB Sleep Functions
>   Documentation/ABI: Update sysfs-driver-toshiba_acpi entry
> 
>  .../ABI/testing/sysfs-driver-toshiba_acpi          | 93 +++++++++++++++++++---
>  drivers/platform/x86/toshiba_acpi.c                | 87 ++++++++++++++++----
>  2 files changed, 150 insertions(+), 30 deletions(-)

Queued the series, thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
