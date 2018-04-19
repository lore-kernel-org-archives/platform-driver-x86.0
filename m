From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: asus-wireless: Fix NULL pointer
 dereference
Date: Thu, 19 Apr 2018 16:49:51 -0700
Message-ID: <20180419234951.GB11546@fury>
References: <CA+A7VXUb-u9=MDRrZxpwGiuFwQAdYCJoxaZHjLPLAcYc6PTEHQ@mail.gmail.com>
 <20180419140434.15131-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180419140434.15131-1-jprvita@endlessm.com>
Sender: stable-owner@vger.kernel.org
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, Dun Hum <bitter.taste@gmx.com>, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 19, 2018 at 07:04:34AM -0700, João Paulo Rechi Vita wrote:
> When the module is removed the led workqueue is destroyed in the remove
> callback, before the led device is unregistered from the led subsystem.

Queued up, thanks.
-- 
Darren Hart
VMware Open Source Technology Center
