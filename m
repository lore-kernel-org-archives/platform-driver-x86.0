From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] eeepc-wmi: change wireless key event to toggle all wireless
 devices.
Date: Thu, 28 Jun 2012 14:59:58 +0800
Message-ID: <4FEC00EE.7040007@canonical.com>
References: <1340162788-531-1-git-send-email-alex.hung@canonical.com> <20120626183349.GB29375@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120626183349.GB29375@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: corentincj@iksaif.net, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 06/27/2012 02:33 AM, Matthew Garrett wrote:
> Is this the expected behaviour (ie, is this what happens on Windows as
> well)?
>

Windows has an hotkey application called ATK. When Fn+F2 is pressed, it 
displays options for turning on/off for WLAN and Bluebooth.

ASUS agreed this is better as the previous code only turns off WLAN and 
there is no way to turn off Bluetooth.
