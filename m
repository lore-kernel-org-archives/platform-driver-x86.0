From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Fix hotkeys registration on some toshiba
 models
Date: Thu, 10 Sep 2015 09:20:52 -0700
Message-ID: <20150910162052.GC113820@vmdeb7>
References: <1441819545-11619-1-git-send-email-coproscefalo@gmail.com>
 <1441819545-11619-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441819545-11619-2-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 09, 2015 at 11:25:45AM -0600, Azael Avalos wrote:
> Commit a2b3471b5b13 ("toshiba_acpi: Use the Hotkey Event Type function
> for keymap choosing") changed the *setup_keyboard function to query for
> the Hotkey Event Type to help choose the correct keymap, but turns out
> that here are certain Toshiba models out there not implementing this
> feature, and thus, failing to continue the input device registration and
> leaving such laptops without hotkey support.
> 
> This patch changes such check, and instead of returning an error if
> the Hotkey Event Type is not present, we simply inform userspace about it,
> changing the message printed from err to notice, making the function
> responsible for registering the input device to continue.
> 
> This issue was found on a Toshiba Portege Z30-B, but there might be
> some other models out there affected by this regression as well.
> 
> Cc: <stable@vger.kernel.org> # 4.1+
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued for 4.3, thanks!

-- 
Darren Hart
Intel Open Source Technology Center
