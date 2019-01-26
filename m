From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: Allow loading on systems without
 the Asus Management GUID
Date: Sat, 26 Jan 2019 13:18:46 -0800
Message-ID: <20190126211846.GC13882@wrath>
References: <20190121132436.31825-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190121132436.31825-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 21, 2019 at 02:24:36PM +0100, Hans de Goede wrote:
> hid-asus depends on asus-wmi through the asus_wmi_evaluate_method. Before
> this commit asus-wmi and thus hid-asus could not be loaded on non Asus
> systems. This breaks using Asus bluetooth keyboards such as the Asus
> T100CHI keyboard with non Asus systems.
> 
> This commit fixes this by allowing asus-wmi to load on systems without the
> Asus Management GUID.
> 
> This is save to do since all asus-wmi sub drivers use
> asus_wmi_register_driver which also checks for the GUID.
> 
> This commit also improves the error messages in asus_wmi_register_driver
> to include "ASUS" in their description tom make them more clear. This is
> important since we now rely on those errors when loaded on systems without
> the Asus Management GUID.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Hi Hans,

A few typos above, please consider adding a spellchecker to your editor for
commit message authoring... I've taken care of them and queued this patch for
testing.

Thanks!

-- 
Darren Hart
VMware Open Source Technology Center
