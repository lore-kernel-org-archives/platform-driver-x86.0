Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF411F80C3
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729021100; cv=none; b=eqLf6lsYv9ivA0HiA8Ke6lLU5O+FLxG7GvZ475T03zfkslx8etljleWCgNubS8e13HIreAzOMZv7+J3xDrJaglfv6e2PzEPsgpS0RrPAyqrEBRl7bRUN3FEapRapzeM6Ma4wGSal9ZV2SvYGXleNXSNQJoFKP2J47rwHHzTryFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729021100; c=relaxed/simple;
	bh=y++S5PvY7WR9ZqsqICdNhqGz14xLf35c8IgpQVnLUak=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M8ORnYkvWOIdBomFBjnDHGPoZq/oCTB6yj4eUa7gZnUq/FXbxzSS2QyM1Wuan+gpHOBZXaWbRMS3yNGdct+oakFP28JmpSENkS3dPpiH0sRu48XeMMoHSkSOSFgbs5A1pCLNInbj0iiSogeW1juvcqlfY4zhLy0o7KTeQONvoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=kYmwFSVH; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="kYmwFSVH"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id F01DD402A5;
	Tue, 15 Oct 2024 12:38:16 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id CEE06402CF;
	Tue, 15 Oct 2024 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=qhFew7fomqec
	+JUKKMsR7rJAO0M=; b=kYmwFSVHN49Qh7AH0yEUGjlMuLsEUctHMZznUa6sjme4
	iK3P6kAnx+kiAdFKGnZIQIKu84whdvZvlo2piv7SPSuvCu6+7NPWu8VcOuTlCGjU
	Fs0s9C3j7x1Dm5gzgGAQUha7c2S6l4A9uHE5rZ1pOIgTNUZ0sYQyWQ5CNIeGf0w=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=Eb4KXb
	NF74t690MgBE0CTN0S+fYya5XWRnH+s5GmZgKq9FtKaBWLe8ebeYiaSx+iTCoQ7+
	//bEEWQBfONvVabudwykBO9IUHcw4p8dRwr8BDFLd8IN4zGfyVc3n3mzUnP8C2N/
	4VBzTG2c3xFoA0nabkONKXZtj0XF/Y4gCPGa0=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id BEAA3402A5;
	Tue, 15 Oct 2024 12:38:16 -0700 (PDT)
Message-ID: <f9937da3-6ce6-487c-8d4b-7001dfe212e3@fatooh.org>
Date: Tue, 15 Oct 2024 12:38:16 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: please help with intermittent s2idle problem on AMD laptop
To: Mario Limonciello <mario.limonciello@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
 <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
 <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
 <2252c724-fd5e-4c22-8696-c168e3830143@amd.com>
 <d149b40c-c9dc-4db7-9cac-97b95f447321@fatooh.org>
 <15cc08fb-5edc-46ce-982e-858ad31b671f@amd.com>
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <15cc08fb-5edc-46ce-982e-858ad31b671f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-10-15 07:04, Mario Limonciello wrote:
> On 10/14/2024 18:31, Corey Hickey wrote:
>>> The STB functionality issue and your suspend issue are tangential issues.
>>
>> Yes, I was hoping to be able to use STB to help troubleshoot. I do not
>> know if that is the right approach.
> 
> I don't think it will help you in this context. Even if STB was enabled
> by your BIOS you wouldn't be able to access it from Linux if the host
> froze or rebooted for some reason.

Ah ok. I did not know the STB was non-persistent.

Anyhow, I reported the lack of AMD CBS to framework support and they
logged it as a feature request.

If there's any use of me testing anything for the STB further, I'm
definitely willing to try, but otherwise, I'll move on.

>>> Something I think notable about your system is you are using two SSDs
>>> which is (relatively) uncommon.  Have you already updated the firmware
>>> on both SSDs to the latest?
>>
>> I have not, it seems. The drives come with stock firmware:
>> $ sudo nvme list
>> Node                  Generic               SN
>> Model                                    Namespace
>> Usage                      Format           FW Rev
>> --------------------- --------------------- --------------------
>> ---------------------------------------- ----------
>> -------------------------- ---------------- --------
>> /dev/nvme0n1          /dev/ng0n1            241802800078
>> WD_BLACK SN770 1TB                       0x1          1.00  TB /   1.00
>> TB    512   B +  0 B   731100WD
>> /dev/nvme1n1          /dev/ng1n1            24102U800015
>> WD_BLACK SN770M 1TB                      0x1          1.00  TB /   1.00
>> TB    512   B +  0 B   731100WD
>>
>> ...and it seems that version 731120WD is available for each. I can
>> try upgrading later (one at a time, with maybe a day or so in between).
>>
>> For reference:
>> https://community.wd.com/t/firmware-upgrade-utility-for-linux/210120/13
>> https://community.frame.work/t/western-digital-drive-update-guide-
>> without-windows-wd-dashboard/20616
>> https://wddashboarddownloads.wdc.com/wdDashboard/firmware/
>> WD_BLACK_SN770_1TB/731120WD/device_properties.xml
>> https://wddashboarddownloads.wdc.com/wdDashboard/firmware/
>> WD_BLACK_SN770M_1TB/731120WD/device_properties.xml
> 
> Before you upgrade can you please also capture 'fwupdmgr get-devices
> --json' output?  If the SSD upgrade helps you I do want to flag that
> this issue in amd_s2idle.py for the future for anyone else with the same
> SSD + SSD F/W to tell them they should upgrade too.

I already updated the SN770 SSD last night, but it had the same firmware
as is still on the SN770M. The current output is below.

     {
       "Name" : "WD BLACK SN770 1TB",
       "DeviceId" : "3743975ad7f64f8d6575a9ae49fb3a8856fe186f",
       "InstanceIds" : [
         "NVME\\VEN_15B7&DEV_5017",
         "NVME\\VEN_15B7&DEV_5017&SUBSYS_15B75017",
         "WD_BLACK SN770 1TB"
       ],
       "Guid" : [
         "1524d43d-ed91-5130-8cb6-8b8478508bae",
         "87cfda90-ce08-52c3-9bb5-0e0718b7e57e",
         "914bfa00-b683-532c-8c3c-71a59e7ae800"
       ],
       "Serial" : "241802800078",
       "Summary" : "NVM Express solid state drive",
       "Plugin" : "nvme",
       "Protocol" : "org.nvmexpress",
       "Flags" : [
         "internal",
         "updatable",
         "require-ac",
         "registered",
         "needs-reboot",
         "usable-during-update"
       ],
       "Vendor" : "Sandisk Corp",
       "VendorId" : "NVME:0x15B7",
       "Version" : "731120WD",
       "VersionFormat" : "plain",
       "Icons" : [
         "drive-harddisk"
       ],
       "Created" : 1729019306
     },
     {
       "Name" : "WD BLACK SN770M 1TB",
       "DeviceId" : "71b677ca0f1bc2c5b804fa1d59e52064ce589293",
       "InstanceIds" : [
         "NVME\\VEN_15B7&DEV_5042",
         "NVME\\VEN_15B7&DEV_5042&SUBSYS_15B75042",
         "WD_BLACK SN770M 1TB"
       ],
       "Guid" : [
         "c3e81c2c-00bb-55d1-b384-b11e2b85146c",
         "0e7ea477-bf9e-5d83-9b17-54fe83b54e01",
         "f8a47d37-820f-5df1-a63d-0231d8c00de6"
       ],
       "Serial" : "24102U800015",
       "Summary" : "NVM Express solid state drive",
       "Plugin" : "nvme",
       "Protocol" : "org.nvmexpress",
       "Flags" : [
         "internal",
         "updatable",
         "require-ac",
         "registered",
         "needs-reboot",
         "usable-during-update"
       ],
       "Vendor" : "Sandisk Corp",
       "VendorId" : "NVME:0x15B7",
       "Version" : "731100WD",
       "VersionFormat" : "plain",
       "Icons" : [
         "drive-harddisk"
       ],
       "Created" : 1729019306
     }


This morning, I found the laptop unable to resume; this is still with
the test kernel I've been using since I first reported the issue here. I
have needed to roll back to 6.10.6-amd64 now, though, due to some
graphical issues (which I have not yet investigated and presume are
unrelated).

I did notice something else meanwhile:

$ for i in nvme0 nvme1 ; do echo "-- $i --" ; sudo nvme smart-log "/dev/$i" ; done
-- nvme0 --
Smart Log for NVME device:nvme0 namespace-id:ffffffff
critical_warning			: 0
temperature				: 86 °F (303 K)
available_spare				: 100%
available_spare_threshold		: 10%
percentage_used				: 0%
endurance group critical warning summary: 0
Data Units Read				: 5,322,091 (2.72 TB)
Data Units Written			: 163,768 (83.85 GB)
host_read_commands			: 12,838,207
host_write_commands			: 1,674,918
controller_busy_time			: 21
power_cycles				: 157
power_on_hours				: 8
unsafe_shutdowns			: 8
media_errors				: 0
num_err_log_entries			: 0
Warning Temperature Time		: 0
Critical Composite Temperature Time	: 0
Temperature Sensor 1			: 102 °F (312 K)
Temperature Sensor 2			: 86 °F (303 K)
Thermal Management T1 Trans Count	: 0
Thermal Management T2 Trans Count	: 0
Thermal Management T1 Total Time	: 0
Thermal Management T2 Total Time	: 0
-- nvme1 --
Smart Log for NVME device:nvme1 namespace-id:ffffffff
critical_warning			: 0
temperature				: 86 °F (303 K)
available_spare				: 100%
available_spare_threshold		: 10%
percentage_used				: 0%
endurance group critical warning summary: 0
Data Units Read				: 3,924,594 (2.01 TB)
Data Units Written			: 3,422,763 (1.75 TB)
host_read_commands			: 15,470,118
host_write_commands			: 5,547,092
controller_busy_time			: 38
power_cycles				: 5,745
power_on_hours				: 45
unsafe_shutdowns			: 5,597
media_errors				: 0
num_err_log_entries			: 0
Warning Temperature Time		: 0
Critical Composite Temperature Time	: 0
Temperature Sensor 1			: 105 °F (314 K)
Temperature Sensor 2			: 86 °F (303 K)
Thermal Management T1 Trans Count	: 0
Thermal Management T2 Trans Count	: 0
Thermal Management T1 Total Time	: 0
Thermal Management T2 Total Time	: 0



For nvme1, the power_cycles and unsafe_shutdowns values look very fishy,
especially in comparison to nvme0. These two SSDs are new and have both
been present in the laptop since I assembled it.

I am unsure about the power_on_hours; 45 might be too high and 8 seems
too low.

The differences in reads and writes are (mostly?) explained by being in
a RAID--one drive did the initial sync to the other drive.

Unfortunately, I don't have a reading from right after installation, so
I don't know if I received a bad drive (I bought it new and the
packaging seemed intact). I also hesitate to blame the SSD for those
values--it could be a victim of system trouble, I think.

I will track these more as I go.


Thank you,
Corey
