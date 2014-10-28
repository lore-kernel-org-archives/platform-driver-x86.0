From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/2] acer-wmi: Add acpi_backlight=video quirk for the
 Acer KAV80
Date: Mon, 27 Oct 2014 21:29:08 -0700
Message-ID: <20141028042907.GB60814@vmdeb7>
References: <1413986798-27689-1-git-send-email-hdegoede@redhat.com>
 <1413986798-27689-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413986798-27689-2-git-send-email-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <darren@dvhart.com>, Corentin Chary <corentin.chary@gmail.com>, Lee Chun-Yi <jlee@suse.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 22, 2014 at 04:06:38PM +0200, Hans de Goede wrote:
> The acpi-video backlight interface on the Acer KAV80 is broken, and worse
> it causes the entire machine to slow down significantly after a suspend/resume.
> 
> Blacklist it, and use the acer-wmi backlight interface instead. Note that
> the KAV80 is somewhat unique in that it is the only Acer model where we
> fall back to acer-wmi after blacklisting, rather then using the native
> (e.g. intel) backlight driver. This is done because there is no native
> backlight interface on this model.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1128309
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> --
> Changes in v2: Improve commit message

Queued, thanks Hans.

-- 
Darren Hart
Intel Open Source Technology Center
